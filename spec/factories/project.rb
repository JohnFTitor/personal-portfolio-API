FactoryBot.define do
  factory :project, class: 'Project' do
    title { FFaker::Lorem.characters(10) }
    images do
      [Rack::Test::UploadedFile.new('spec/assets/test.png', 'image/png'),
       Rack::Test::UploadedFile.new('spec/assets/test.png', 'image/png')]
    end
    tags { 5.times.map { FFaker::Lorem.characters(5) } }
    description { FFaker::Lorem.characters(100) }
    live { FFaker::Lorem.characters(20) }
    source { FFaker::Lorem.characters(20) }
    demo { FFaker::Lorem.characters(20) }
  end
end
