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
      t.string :image, default: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png"

      # t.string :google_token
      # t.string :google_refresh_token
      t.timestamps
    end
  end
end
