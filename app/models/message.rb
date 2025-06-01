class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :account
  belongs_to :inbox
  belongs_to :sender, polymorphic: true, optional: true

  validates :content, presence: true
  validates :conversation, presence: true
  validates :account, presence: true
  validates :inbox, presence: true
end
