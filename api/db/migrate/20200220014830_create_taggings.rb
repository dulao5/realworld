# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table(:taggings, options: 'AUTO_ID_CACHE 1') do |t|
      t.belongs_to :article, null: false, foreign_key: true, index: false
      t.belongs_to :tag, null: false, foreign_key: true, index: false

      t.timestamps
    end

    add_index :taggings, %i[article_id tag_id], unique: true
  end
end
