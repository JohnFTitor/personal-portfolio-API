FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password_digest { FFaker::Internet.password }
  end
end
