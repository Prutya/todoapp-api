class TodoGroup < ApplicationRecord
  has_many :todos, dependent: :destroy
end
