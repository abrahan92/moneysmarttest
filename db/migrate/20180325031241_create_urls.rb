class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :original_url
      t.text :short_url

      t.timestamps
    end
  end
end
