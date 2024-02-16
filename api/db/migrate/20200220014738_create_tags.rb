# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table(:tags, options: 'AUTO_ID_CACHE 1') do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :taggings_count, null: false, default: 0
      t.timestamps
    end
  end
end
