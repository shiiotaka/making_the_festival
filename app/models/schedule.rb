class Schedule < ApplicationRecord
  belongs_to :artist # Artistモデルに紐付いている
  belongs_to :time_table # TimeTableモデルに紐付いている

  # validates :appearance_time, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 4 }, if: :test # 整数のみ許可、2以上4以下
end
