# frozen_string_literal: true

# Change the JSON column setup for a flat one
class AddAndRemoveColumnsFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_data
    add_all_the_other_columns
  end

  private

  def remove_data
    reversible do |dir|
      change_table :jobs do |t|
        dir.up { t.remove :data }
        dir.down { t.jsonb :data }
      end
    end
  end

  def add_all_the_other_columns
    change_table :jobs, bulk: true do |t|
      t.change_default :favorite, false
      t.string :api_id, :title, :salary, :description, :functions, :benefits,
               :city, :country, :country_flag_url, :seniority, :logo_url, :url,
               :modality, :published_at
      t.boolean :recommended, :pinned, :is_hot, :remote, default: false
      t.boolean :new, default: true
      t.jsonb :company
    end
  end
end
