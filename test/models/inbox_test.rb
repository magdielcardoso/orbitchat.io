require "test_helper"

class InboxTest < ActiveSupport::TestCase
  def setup
    @account = Account.create!(name: "Empresa Exemplo", email: "conta@exemplo.com")
    @channel_types = YAML.load_file(Rails.root.join("config/channel_types.yml")).keys
    @inbox = Inbox.new(
      name: "Suporte WhatsApp",
      account: @account,
      channel_type: @channel_types.first,
      active: true
    )
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @inbox.valid?
  end

  test "deve exigir name, account e channel_type" do
    @inbox.name = nil
    assert_not @inbox.valid?
    @inbox.name = "Suporte WhatsApp"
    @inbox.account = nil
    assert_not @inbox.valid?
    @inbox.account = @account
    @inbox.channel_type = nil
    assert_not @inbox.valid?
  end

  test "name deve ser único por account" do
    @inbox.save!
    outra = Inbox.new(name: @inbox.name, account: @account, channel_type: @channel_types.last)
    assert_not outra.valid?, "Nome duplicado na mesma account deve ser inválido"
    outra_account = Account.create!(name: "Outra Empresa", email: "outra@empresa.com")
    outra.account = outra_account
    assert outra.valid?, "Mesmo nome em accounts diferentes deve ser válido"
  end

  test "channel_type deve ser um dos valores do YML" do
    @inbox.channel_type = "invalido"
    assert_not @inbox.valid?
    @inbox.channel_type = @channel_types.sample
    assert @inbox.valid?
  end

  test "deve ser possível criar, atualizar e destruir inbox" do
    # FIXME: Este teste depende da existência do model Conversation.
    # Quando Conversation for implementado, este teste deve passar normalmente.
    assert_difference("Inbox.count", 1) { @inbox.save! }
    @inbox.update!(name: "Comercial E-mail", channel_type: @channel_types.last)
    assert_equal "Comercial E-mail", @inbox.reload.name
    assert_difference("Inbox.count", -1) { @inbox.destroy }
  end

  test "deve exigir associação obrigatória com account" do
    inbox = Inbox.new(name: "Sem Conta", channel_type: @channel_types.first)
    assert_not inbox.valid?
  end
end
