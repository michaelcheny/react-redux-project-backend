# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :state
      t.string :country
      t.string :image, default: "https://tr.rbxcdn.com/0e69c8de1ccffe9be5adc02eb423e793/420/420/Decal/Png"

      # t.string :google_token
      # t.string :google_refresh_token
      t.timestamps
    end
  end
end
