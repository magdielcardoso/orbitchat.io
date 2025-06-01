require "test_helper"

class ContactTest < ActiveSupport::TestCase
  def setup
    @account = Account.create!(name: "Empresa Exemplo", email: "conta@exemplo.com")
    @contact = Contact.new(
      name: "Cliente Exemplo",
      email: "cliente@exemplo.com",
      account: @account
    )
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @contact.valid?
  end

  test "deve exigir name e account" do
    @contact.name = nil
    assert_not @contact.valid?
    @contact.name = "Cliente Exemplo"
    @contact.account = nil
    assert_not @contact.valid?
  end

  test "email deve ter formato válido se presente" do
    @contact.email = "invalido"
    assert_not @contact.valid?
    @contact.email = "valido@email.com"
    assert @contact.valid?
    @contact.email = nil
    assert @contact.valid?
  end

  test "deve permitir criar, atualizar e destruir contact" do
    assert_difference("Contact.count", 1) { @contact.save! }
    @contact.update!(name: "Novo Nome")
    assert_equal "Novo Nome", @contact.reload.name
    assert_difference("Contact.count", -1) { @contact.destroy }
  end

  test "ao destruir contact, conversations associadas devem ser destruídas se dependente" do
    @contact.save!
    inbox = Inbox.create!(name: "Inbox", account: @account, channel_type: Inbox::CHANNEL_TYPES.first, active: true)
    conversation = Conversation.create!(inbox: inbox, contact: @contact)
    assert_difference("Conversation.count", -1) do
      @contact.destroy
    end
  end
end
