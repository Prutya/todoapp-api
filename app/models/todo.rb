# frozen_string_literal: true

class Todo < ApplicationRecord
  scope :active, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end
