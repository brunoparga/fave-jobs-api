# frozen_string_literal: true

# Controller for the user's favorite jobs
class JobsController < ApplicationController
  def index
    render json: Job.select(:api_id, :city, :company, :country, :favorite, :id,
                            :logo_url, :remote, :salary, :title)
  end

  def show
    # Note to self: if you want to access company name 'foo', do:
    #   Job.where("company->'name' = ?", 'foo'.to_json)
    # Now I wonder if this would also work when the entire company data was
    # represented as JSON...
    render json: Job.find_by(api_id: params[:id])
  end
end
