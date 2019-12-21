# frozen_string_literal: true

# *All* jobs in the DB are user favorites.
class RemoveFavoriteFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :favorite, :boolean
  end
end
