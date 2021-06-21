class TimeTable < ApplicationRecord
  has_many :schedules # 複数のScheduleを持っている(中間テーブル)
  has_many :artists, through: :schedules # 複数のArtistを持っていて、中間モデルにSchedulesがある
  belongs_to :user # Userモデルに属している

  validates_associated :artists # Artistモデルのバリデーションを実行
  accepts_nested_attributes_for :artists, allow_destroy: true # Artistモデルを更新、削除刷ることができる
end
