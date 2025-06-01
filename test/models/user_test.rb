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

  test "deve permitir atualizar email e senha para valores válidos" do
    @user.save!
    novo_email = "novo_#{SecureRandom.hex(4)}@exemplo.com"
    @user.update!(email: novo_email, password: "novaSenha123", password_confirmation: "novaSenha123")
    assert_equal novo_email, @user.reload.email
    autenticado = User.find_for_authentication(email: novo_email)
    assert autenticado.valid_password?("novaSenha123")
  end

  test "não deve permitir atualizar email para um já existente" do
    @user.save!
    outro = User.create!(email: "outro_#{SecureRandom.hex(4)}@exemplo.com", password: "senha123", password_confirmation: "senha123", account: @account)
    assert_raises ActiveRecord::RecordInvalid do
      outro.update!(email: @user.email)
    end
  end

  test "deve permitir destruir user normalmente" do
    @user.save!
    assert_difference("User.count", -1) do
      @user.destroy
    end
  end

  test "exclusão de user não afeta a account" do
    @user.save!
    assert_no_difference("Account.count") do
      @user.destroy
    end
  end

  test "não deve permitir remover associação com account após criado" do
    @user.save!
    @user.account = nil
    assert_not @user.valid?
  end
end
