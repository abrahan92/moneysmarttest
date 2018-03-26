class AddEnvToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :mac, :integer
    add_column :urls, :windows, :integer
    add_column :urls, :linux, :integer
    add_column :urls, :unix, :integer
    add_column :urls, :other, :integer
  end
end
