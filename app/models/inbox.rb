class Inbox < ApplicationRecord
  belongs_to :account
  has_many :conversations, dependent: :destroy

  # Mapeia o tipo simples (ex: 'api') para o nome da classe polimórfica (ex: 'Channel::Api')
  def self.polymorphic_channel_type(type)
    "Channel::#{type.to_s.camelize}"
  end

  # Carrega e memoriza os tipos de canal apenas uma vez
  CHANNEL_TYPES = YAML.load_file(Rails.root.join("config/channel_types.yml")).keys.freeze
  POLYMORPHIC_CHANNEL_TYPES = CHANNEL_TYPES.map { |t| polymorphic_channel_type(t) }.freeze

  validates :name, presence: true, uniqueness: { scope: :account_id }
  validates :account, presence: true
  validates :channel_type, presence: true, inclusion: { in: POLYMORPHIC_CHANNEL_TYPES }

  # Retorna os tipos de canal definidos no YML
  def self.channel_types_from_yml
    YAML.load_file(Rails.root.join("config/channel_types.yml")).keys
  end
end
