class UrlsController < ApplicationController
  before_action :find_url, only: [:show, :edit, :update, :destroy, :shortened]
  skip_before_action :verify_authenticity_token

  def index
      @urls = Url.where("user_id = ?", current_user.id)
  end

  def stats
    @url = Url.find(params[:id])
  end

  def show
    helpers.click_count(@url)
    helpers.env(@url)
    redirect_to @url.sanitized_url

  end

  def create
    @user = current_user
    @url = @user.urls.create!(url_params)
    @url.update(:clicks => 0, 
                :mac => 0, 
                :windows => 0, 
                :linux => 0, 
                :unix => 0, 
                :other => 0)
    @url.sanitize
    if @url.new_url?
      if @url.save
        redirect_to '/users/' + current_user.id.to_s + '/urls'
      else
        flash[:error] = "Check the error below:"
        render 'index'
      end
    else
      flash[:notice] = "A short link for this URL is already in our database"
      redirect_to '/users/' + current_user.id.to_s + '/urls'
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    respond_to do |format|
      format.html { redirect_to "/users/"+current_user.id.to_s+"/urls", notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_url
    @url = Url.find_by_short_url(params[:short_url])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
