class Artist < ApplicationRecord
  has_many :schedules # 複数のSchduleモデルを持っている
end
