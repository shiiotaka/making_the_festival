class TimeTable < ApplicationRecord
  has_many :schedules # 複数のScheduleを持っている
  has_many :artists, through: :schedules # 複数のArtistを持っていて、中間モデルにSchedulesがある
  belongs_to :user # Userモデルに属している

  validates_associated :artists
  accepts_nested_attributes_for :artists

end
