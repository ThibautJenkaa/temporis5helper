class AddAnkamaIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :ankama_id, :string
  end
end
