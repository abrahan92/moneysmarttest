class AddSanitedurlToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :sanitized_url, :string
  end
end
