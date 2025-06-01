class Conversation < ApplicationRecord
  belongs_to :inbox
  belongs_to :contact
  has_many :messages, dependent: :destroy

  validates :inbox, presence: true
  validates :contact, presence: true

  include AASM
  aasm column: :status do
    state :open, initial: true
    state :pending
    state :resolved
    state :archived

    event :pending do
      transitions from: [ :open ], to: :pending
    end
    event :resolve do
      transitions from: [ :open, :pending ], to: :resolved
    end
    event :archive do
      transitions from: [ :open, :pending, :resolved ], to: :archived
    end
    event :reopen do
      transitions from: [ :resolved, :archived ], to: :open
    end
  end
end
