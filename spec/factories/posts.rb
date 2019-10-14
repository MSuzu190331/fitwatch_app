FactoryBot.define do

  factory :post do
    name_id              {"2"}
    about                {"華奢で可愛い時計"}
    image                {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    created_at           { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end

end