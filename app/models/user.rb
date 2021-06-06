class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }      # 3文字以上
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }          # passwordが一致しているかの比較
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] } # password_confirmationが空白でないこと

  validates :email, uniqueness: true                                                                     # email属性の値が一意であること
end
