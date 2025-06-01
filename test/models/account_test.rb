require "test_helper"

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(
      name: "Empresa Exemplo",
      email: "contato@exemplo.com"
    )
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
end
