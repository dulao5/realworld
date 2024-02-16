# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table(:profiles, options: 'AUTO_ID_CACHE 1') do |t|
      t.text :bio, null: true
      t.string :image_url
      t.belongs_to :user, null: false, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
