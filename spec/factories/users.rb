FactoryBot.define do

  factory :user do
    name                  {"suzuki"}
    nickname              {"suzu"}
    Prefectures           {"大阪府"}
    address               {"大阪市中央区難波5丁目1−60 なんばスカイオ15階"}
    sequence(:email)      {Faker::Internet.email}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end