class Task < ApplicationRecord
  has_many :pomodoros, dependent: :destroy
end
