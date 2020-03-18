class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.boolean :online
      t.belongs_to :category

      t.timestamps
    end
  end
end
