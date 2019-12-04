# frozen_string_literal: true

# Controller for the user's favorite jobs
class JobsController < ApplicationController
  def index
    render json: Job.all
  end
end
