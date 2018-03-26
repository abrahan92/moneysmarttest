class AddUserIdToUrls < ActiveRecord::Migration[5.1]
  def change
    add_reference :urls, :user, index: true
    add_foreign_key :urls, :users
  end
end
