class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :level
      t.string :category
      t.string :url_img

      t.timestamps
    end
  end
end
