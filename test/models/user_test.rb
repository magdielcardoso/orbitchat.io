require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    User.delete_all
    @account = Account.create!(name: "Empresa Exemplo", email: "conta@exemplo.com")
    @user = User.new(
      email: "usuario_#{SecureRandom.hex(4)}@exemplo.com",
      password: "senhaSegura123",
      password_confirmation: "senhaSegura123",
      account: @account
    )
  end

  test "deve ser válido com atributos obrigatórios e associação" do
    assert @user.valid?
  end

  test "deve exigir email, senha e associação com account" do
    @user.email = nil
    assert_not @user.valid?
    @user.email = "usuario_#{SecureRandom.hex(4)}@exemplo.com"
    @user.password = nil
    assert_not @user.valid?
    @user.password = "senhaSegura123"
    @user.account = nil
    assert_not @user.valid?
  end

  test "email deve ser único globalmente" do
    @user.save!
    outro = User.new(email: @user.email, password: "outraSenha123", password_confirmation: "outraSenha123", account: @account)
    assert_not outro.valid?, "Email duplicado deve ser inválido"
    outra_account = Account.create!(name: "Outra Empresa", email: "outra@empresa.com")
    outro.account = outra_account
    assert_not outro.valid?, "Mesmo email em accounts diferentes deve ser inválido"
    outro.email = "outro_#{SecureRandom.hex(4)}@email.com"
    assert outro.valid?, "Email diferente deve ser válido"
  end

  test "email deve ter formato válido" do
    @user.email = "invalido"
    assert_not @user.valid?
    @user.email = "valido_#{SecureRandom.hex(4)}@email.com"
    assert @user.valid?
  end

  test "autenticação devise deve funcionar" do
    @user.save!
    autenticado = User.find_for_authentication(email: @user.email)
    assert autenticado.valid_password?("senhaSegura123")
    assert_not autenticado.valid_password?("senhaErrada")
  end
end
