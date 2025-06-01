require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @account = Account.create!(name: "Empresa Exemplo", email: "conta@exemplo.com")
    tipo_simples = Inbox.channel_types_from_yml.first
    @inbox = Inbox.create!(name: "Inbox Teste", account: @account, channel_type: Inbox.polymorphic_channel_type(tipo_simples), active: true)
    @contact = Contact.create!(name: "Cliente", email: "cliente@exemplo.com", account: @account)
    @conversation = Conversation.create!(inbox: @inbox, contact: @contact)
    @message = Message.new(
      content: "Olá, isso é um teste!",
      conversation: @conversation,
      account: @account,
      inbox: @inbox,
      private: false,
      status: 0
    )
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @message.valid?
  end

  test "deve exigir content, conversation, account e inbox" do
    @message.content = nil
    assert_not @message.valid?
    @message.content = "Texto"
    @message.conversation = nil
    assert_not @message.valid?
    @message.conversation = @conversation
    @message.account = nil
    assert_not @message.valid?
    @message.account = @account
    @message.inbox = nil
    assert_not @message.valid?
  end

  test "deve permitir associação polimórfica com sender" do
    user = User.create!(email: "agente@exemplo.com", password: "senha123", password_confirmation: "senha123", account: @account)
    @message.sender = user
    assert @message.valid?
    @message.save!
    assert_equal user, @message.sender
  end
end
