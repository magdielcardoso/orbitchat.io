class UsersController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Users/Index.vue
    render inertia: "Users/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Users/Show.vue
    render inertia: "Users/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Users/New.vue
    render inertia: "Users/New"
  end

  def create
    redirect_to users_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Users/Edit.vue
    render inertia: "Users/Edit"
  end

  def update
    redirect_to users_url
  end

  def destroy
    redirect_to users_url
  end
end
