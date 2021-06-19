class Schedule < ApplicationRecord
  belongs_to :artist # Artistモデルに紐付いている
  belongs_to :time_table # TimeTableモデルに紐付いている
end
