require "test_helper"

class Channel::ApiTest < ActiveSupport::TestCase
  def setup
    @api_channel = Channel::Api.new(
      webhook_url: "https://webhook.example.com",
      token: "abc123",
      active: true,
      settings: { foo: "bar" }
    )
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @api_channel.valid?
  end

  test "deve persistir e recuperar campos" do
    assert_difference("Channel::Api.count", 1) do
      @api_channel.save!
    end
    canal = Channel::Api.last
    assert_equal "https://webhook.example.com", canal.webhook_url
    assert_equal "abc123", canal.token
    assert canal.active
    assert_equal({ "foo" => "bar" }, canal.settings)
  end

  test "deve permitir associação com inbox" do
    @api_channel.save!
    account = Account.create!(name: "Empresa", email: "empresa@exemplo.com")
    inbox = Inbox.new(name: "Inbox API", account: account, channel_type: "Channel::Api", channel_id: @api_channel.id, active: true)
    assert inbox.valid?
    inbox.save!
    assert_equal @api_channel.id, inbox.channel_id
    assert_equal "Channel::Api", inbox.channel_type
  end
end
