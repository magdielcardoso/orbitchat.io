require "test_helper"

class ConversationTest < ActiveSupport::TestCase
  def setup
    @account = Account.create!(name: "Empresa Exemplo", email: "conta@exemplo.com")
    tipo_simples = Inbox.channel_types_from_yml.first
    @inbox = Inbox.create!(name: "Suporte WhatsApp", account: @account, channel_type: Inbox.polymorphic_channel_type(tipo_simples), active: true)
    @contact = Contact.create!(name: "Cliente", email: "cliente@exemplo.com", account: @account)
    @conversation = Conversation.new(
      inbox: @inbox,
      contact: @contact
    )
  end

  test "deve ser válido com inbox, contact e status inicial" do
    assert @conversation.valid?
    assert_equal "open", @conversation.status
    assert @conversation.open?
  end

  test "deve exigir inbox e contact" do
    @conversation.inbox = nil
    assert_not @conversation.valid?
    @conversation.inbox = @inbox
    @conversation.contact = nil
    assert_not @conversation.valid?
  end

  test "deve permitir transições de estado válidas via AASM" do
    @conversation.save!
    assert @conversation.may_resolve?
    @conversation.resolve!
    assert @conversation.resolved?
    assert @conversation.may_archive?
    @conversation.archive!
    assert @conversation.archived?
    assert @conversation.may_reopen?
    @conversation.reopen!
    assert @conversation.open?
  end

  test "não deve permitir transições inválidas" do
    @conversation.save!
    @conversation.resolve!
    assert_not @conversation.may_pending?
    assert_raises(AASM::InvalidTransition) { @conversation.pending! }
  end

  test "deve atualizar last_activity_at" do
    @conversation.save!
    agora = Time.current
    @conversation.update!(last_activity_at: agora)
    assert_in_delta agora, @conversation.reload.last_activity_at, 1.second
  end
end
