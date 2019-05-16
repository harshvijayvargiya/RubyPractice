class AddFieldToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :is_active, :boolean
  end
end
