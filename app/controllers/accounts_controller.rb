class AccountsController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Accounts/Index.vue
    render inertia: "Accounts/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Accounts/Show.vue
    render inertia: "Accounts/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Accounts/New.vue
    render inertia: "Accounts/New"
  end

  def create
    redirect_to accounts_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Accounts/Edit.vue
    render inertia: "Accounts/Edit"
  end

  def update
    redirect_to accounts_url
  end

  def destroy
    redirect_to accounts_url
  end
end
