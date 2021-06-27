class TimeTable < ApplicationRecord
  has_many :schedules # 複数のScheduleを持っている(中間テーブル)
  has_many :artists, through: :schedules # 複数のArtistを持っていて、中間モデルにSchedulesがある
  belongs_to :user # Userモデルに属している

  validates_associated :artists # Artistモデルのバリデーションを実行
  validates_associated :schedules # Scheduleモデルのバリデーションを実行
  accepts_nested_attributes_for :schedules, allow_destroy: true # Schdulesモデルを更新、削除刷ることができる

  validates :stage, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 4 } # 整数のみ許可、2以上4以下
end
