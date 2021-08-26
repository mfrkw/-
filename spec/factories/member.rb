FactoryBot.define do

  factory :member do
    last_name             {"山田"}
    first_name            {"太郎"}
    email                 {"sample@gmail.com"}
    password              {"123456"}
    encrypted_password    {"123456"}
    postal_code           {"1234567"}
    address               {"埼玉県さいたま市"}
    telephone_number      {"0120828828"}
  end
end