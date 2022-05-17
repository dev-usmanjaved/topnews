# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{Faker::Internet.email}-#{SecureRandom.hex}" }
    first_name { 'Lawrence' }
    last_name { 'Grant' }
    after(:build) do |user|
      user.password = user.password_confirmation = 'Qwaszx@1'
    end
  end
end
