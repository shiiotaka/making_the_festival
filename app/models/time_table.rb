class TimeTable < ApplicationRecord
  has_many :schedules # 複数のScheduleを持っている
  belongs_to :user # Userモデルに属している

end
