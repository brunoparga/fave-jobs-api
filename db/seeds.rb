# frozen_string_literal: true

puts 'Cleaning up database...'
Job.destroy_all

json = JSON.parse(File.read('db/seeds.json'))
puts 'Creating new jobs...'
json['jobs'].each do |job|
  # I am painfully aware of how dumb it is to parse this JSON then unparse it
  # This won't need to happen with the actual API, hopefully
  Job.create(data: job.to_json, favorite: false)
end

puts 'Finished!'
