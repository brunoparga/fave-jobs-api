# frozen_string_literal: true

require 'rails_helper'

describe 'GET /jobs route', type: :request do
  let!(:questions) { FactoryBot.create_list(:job, 20) }
  before { get '/jobs' }

  it 'returns all jobs' do
    expect(json.size).to eq(20)
  end

  it 'has elements with the correct attributes' do
    job_attrs = %w[api_id benefits city country country_flag_url created_at
                   description functions id is_hot logo_url modality new pinned
                   published_at recommended remote salary seniority title
                   updated_at url company]
    expect(json.first.keys).to match_array(job_attrs)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
