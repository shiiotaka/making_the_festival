class Artist < ApplicationRecord

  has_many :schedules
  has_many :time_tables, through: :schedules # 複数のSchduleモデルを持っている
  # has_many :schedules

  validates :name, presence: true
end
