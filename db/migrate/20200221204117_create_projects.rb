class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :owner_id
      t.boolean :online
      t.integer :team_size
      t.belongs_to :category

      t.timestamps
    end
  end
end
