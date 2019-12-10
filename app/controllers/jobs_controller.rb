# frozen_string_literal: true

# Controller for the user's favorite jobs
class JobsController < ApplicationController
  def index
    render json: Job.all
  end

  def create
    p params
    render json: Job.create(job_params)
  end

  def destroy
    render json: Job.find_by(api_id: params[:api_id]).destroy
  end
end
