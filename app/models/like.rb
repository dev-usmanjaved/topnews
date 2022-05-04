# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user

  validates :story_id, uniqueness: { scope: :user }
end
