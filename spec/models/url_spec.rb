require 'rails_helper'

RSpec.describe Url, type: :model do

	before do
    	@url = Url.new
  	end

	it "is not valid without a original url" do
		expect(@url).not_to be_valid
	end
end