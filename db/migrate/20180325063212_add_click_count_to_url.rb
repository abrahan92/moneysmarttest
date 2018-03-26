class AddClickCountToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :clicks, :integer
  end
end
