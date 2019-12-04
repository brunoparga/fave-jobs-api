# frozen_string_literal: true

# The base class from which all models inherit
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
