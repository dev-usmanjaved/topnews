# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :story_id

      t.timestamps
    end

    add_index :likes, %i[user_id story_id], unique: true
  end
end
