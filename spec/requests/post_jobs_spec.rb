# frozen_string_literal: true

require 'rails_helper'

describe 'POST /jobs route', type: :request do
  let(:job) { FactoryBot.build(:job) }

  before do
    post '/jobs', params: { job: job.as_json }
  end

  it 'saves the job to the DB' do
    job_from_db = Job.last.as_json
    job_from_factory = job.as_json

    # The client cannot know what the id and timestamps will be,
    # so we remove those fields for testing
    [job_from_db, job_from_factory].each do |job|
      job.delete_if { |key, _| %w[id created_at updated_at].include?(key) }
    end

    expect(job_from_db).to eq(job_from_factory)
  end

  it 'sends the created job in the response' do
    # This test is distinct from the one above because the API could,
    # in principle, save the job correctly but not send it back to the client,
    # or vice-versa.
    request_job = job.as_json
    response_job = json

    [request_job, response_job].each do |job|
      job.delete_if { |key, _| %w[id created_at updated_at].include?(key) }
    end

    expect(response_job).to eq(request_job)
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
