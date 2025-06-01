class Contact < ApplicationRecord
  belongs_to :account
  has_many :conversations, dependent: :destroy

  validates :name, presence: true
  validates :account, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
