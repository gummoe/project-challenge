FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'email@email.com' }
    password { 'averygoodpassword' }
  end
end
