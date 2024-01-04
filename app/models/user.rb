class User < ApplicationRecord
  authenticates_with_sorcery!
  accepts_nested_attributes_for :authentications
  has_many :authentications, :dependent => :destroy
  has_many :boards, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, uniqueness: true
end
