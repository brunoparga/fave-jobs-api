# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /jobs/:id route', type: :request do
  let!(:job) { FactoryBot.create(:job) }

  before { delete "/jobs/#{job.api_id}" }

  it 'removes the job from the DB' do
    expect { Job.find(job.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'sends a 204 No Content status' do
    expect(response).to have_http_status(:no_content)
  end

  it 'sends the deleted job\'s api_id in a header' do
    expect(response.header['Api-Id']).to eq(job.api_id)
  end
end
