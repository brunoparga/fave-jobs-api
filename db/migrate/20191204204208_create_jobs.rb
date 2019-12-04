# frozen_string_literal: true

# Migration to add Jobs table to DB
class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.jsonb :data
      t.boolean :favorite

      t.timestamps
    end
  end
end
