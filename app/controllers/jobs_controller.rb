# frozen_string_literal: true

# Controller for the user's favorite jobs
class JobsController < ApplicationController
  def index
    render json: Job.all
  end

  def create
    render json: Job.create(job_params), status: :created
  end

  def destroy
    Job.find_by(api_id: params[:api_id]).destroy
    head :no_content, api_id: params[:api_id]
  end

  private

  def job_params
    params
      .require(:job)
      .permit(:api_id, :benefits, :city, :country, :country_flag_url,
              :description, :functions, :is_hot, :logo_url, :modality, :new,
              :pinned, :published_at, :recommended, :remote, :salary,
              :seniority, :title, :url, company: %i[name about url])
  end
end
