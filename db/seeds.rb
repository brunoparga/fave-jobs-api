# frozen_string_literal: true

puts 'Cleaning up database...'
Job.destroy_all

json = JSON.parse(File.read('db/seeds.json'))
puts 'Creating new jobs...'
json['jobs'].each do |job|
  job['api_id'] = job.delete('id')
  Job.create!(job)
end

puts 'Finished!'
