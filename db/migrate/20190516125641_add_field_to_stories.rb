class AddFieldToStories < ActiveRecord::Migration[5.2]
  def change
    add_column :stories, :is_active, :boolean
    add_column :stories, :status, :string
  end
end
