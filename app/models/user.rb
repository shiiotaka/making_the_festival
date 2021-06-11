class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }      # 3文字以上
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }          # passwordが一致しているかの比較
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] } # password_confirmationが空白でないこと
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/,
                       message: 'は半角英数字3文字以上含む必要があります' }

  validates :email, uniqueness: true,                                                                    # メールアドレスが重複しないこと
                    presence: true,                                                                    # メールアドレスが空白でないこと
                    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }                # 正しい入力フォームであること
  validates :name, presence: true                                                                        # 名前が空白でないこと
end
