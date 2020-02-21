class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.integer :reaction_type
      t.references :user, null: false, foreign_key: true
      t.references :reactable, polymorphic: true, index:true

      t.timestamps
    end
  end
end
