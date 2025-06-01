require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.create!(name: "Empresa Exemplo", email: "contato@exemplo.com")
  end

  test "deve ser válido com atributos obrigatórios" do
    assert @account.valid?
  end

  test "deve exigir nome e email" do
    @account.name = nil
    assert_not @account.valid?
    @account.name = "Empresa Exemplo"
    @account.email = nil
    assert_not @account.valid?
  end

  test "email deve ser único, mas nome pode se repetir" do
    @account.save!
    outra = @account.dup
    assert_not outra.valid?, "Email duplicado deve ser inválido"
    outra.email = "outro@email.com"
    assert outra.valid?, "Nome repetido com email diferente deve ser válido"
  end

  test "email deve ter formato válido" do
    @account.email = "invalido"
    assert_not @account.valid?
    @account.email = "valido@email.com"
    assert @account.valid?
  end

  test "deve permitir atualizar nome e email para valores válidos" do
    @account.update!(name: "Nova Empresa", email: "novo@email.com")
    assert_equal "Nova Empresa", @account.reload.name
    assert_equal "novo@email.com", @account.reload.email
  end

  test "não deve permitir atualizar email para um já existente" do
    outra = Account.create!(name: "Outra", email: "outra@email.com")
    assert_raises ActiveRecord::RecordInvalid do
      outra.update!(email: @account.email)
    end
  end

  test "deve permitir destruir account sem dependências obrigatórias" do
    account = Account.create!(name: "Temp", email: "temp@email.com")
    assert_difference("Account.count", -1) do
      account.destroy
    end
  end

  test "ao destruir account, usuários associados devem ser destruídos se dependente" do
    user = User.create!(email: "user_#{SecureRandom.hex(4)}@exemplo.com", password: "senha123", password_confirmation: "senha123", account: @account)
    assert_difference("User.count", -1) do
      @account.destroy
    end
  end
end
