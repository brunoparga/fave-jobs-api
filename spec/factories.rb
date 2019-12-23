FactoryBot.define do
  api_ids = %w[front-end_developer back-end_developer full-stack_developer]
  languages = ['C++', 'JavaScript', 'Malbolge', 'Python', 'Ruby']
  modalities = ['Full time', 'Part time', 'Freelance', 'Internship']
  seniorities = ['Junior', 'Semi Senior', 'Senior', 'Expert']

  factory :job do
    api_id { api_ids.sample }
    benefits { Faker::ChuckNorris.fact }
    city { Faker::Address.city }
    country { Faker::Address.country }
    country_flag_url { 'https://d2dgum4gsvdsrq.cloudfront.net/assets/flags/cl_mini-43732ca1dce0306aebced22a6205cb8bab0d2747005d1154a045776ba5aea7a9.png' }
    description { Faker::Lorem.paragraph }
    functions { Faker::Lorem.paragraph }
    logo_url { Faker::Fillmurray.image(grayscale: true) }
    modality { modalities.sample }
    published_at { Faker::Date.backward(days: 90) }
    remote { rand < 0.2 }
    salary { '2000 - 3000' }
    seniority { seniorities.sample }
    title { "#{seniority} #{languages.sample} #{api_id.sub('_', ' ')}" }
    url { '/empleos/programacion/rails-and-react-full-stack-developer-get-on-board-remoto' }
    company do
      { name: Faker::Company.name,
        about: Faker::Quote.most_interesting_man_in_the_world,
        url: Faker::Internet.url }
    end
  end
end
