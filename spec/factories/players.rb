FactoryBot.define do
  factory :player do
    sequence(:email) { |n| "person#{n}@example.com" }
    name { "Nombre" }
    password { '123456' }
  end
end
