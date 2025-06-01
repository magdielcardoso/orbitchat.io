require "test_helper"

class Channel::EmailTest < ActiveSupport::TestCase
  def setup
    @email_channel = Channel::Email.new(
      email: "canal@email.com",
      smtp_settings: "smtp://smtp.example.com",
      imap_settings: "imap://imap.example.com",
      active: true
    )
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @email_channel.valid?
  end

  test "deve persistir e recuperar campos" do
    assert_difference("Channel::Email.count", 1) do
      @email_channel.save!
    end
    canal = Channel::Email.last
    assert_equal "canal@email.com", canal.email
    assert_equal "smtp://smtp.example.com", canal.smtp_settings
    assert_equal "imap://imap.example.com", canal.imap_settings
    assert canal.active
  end

  test "deve permitir associação com inbox" do
    @email_channel.save!
    account = Account.create!(name: "Empresa", email: "empresa@exemplo.com")
    inbox = Inbox.new(name: "Inbox Email", account: account, channel_type: "Channel::Email", channel_id: @email_channel.id, active: true)
    assert inbox.valid?
    inbox.save!
    assert_equal @email_channel.id, inbox.channel_id
    assert_equal "Channel::Email", inbox.channel_type
  end
end
