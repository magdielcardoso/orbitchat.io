class Inbox < ApplicationRecord
  belongs_to :account
  has_many :conversations, dependent: :destroy

  # Carrega e memoriza os tipos de canal apenas uma vez
  CHANNEL_TYPES = YAML.load_file(Rails.root.join("config/channel_types.yml")).keys.freeze

  validates :name, presence: true, uniqueness: { scope: :account_id }
  validates :account, presence: true
  validates :channel_type, presence: true, inclusion: { in: CHANNEL_TYPES }

  def self.channel_types_from_yml
    YAML.load_file(Rails.root.join("config/channel_types.yml")).keys
  end
end
