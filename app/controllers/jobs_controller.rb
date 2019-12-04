# frozen_string_literal: true

# Controller for the user's favorite jobs
class JobsController < ApplicationController
  def index
    render json: File.read('db/seeds.json')
  end
end
