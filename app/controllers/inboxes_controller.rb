class InboxesController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Inboxes/Index.vue
    render inertia: "Inboxes/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Inboxes/Show.vue
    render inertia: "Inboxes/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Inboxes/New.vue
    render inertia: "Inboxes/New"
  end

  def create
    redirect_to inboxes_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Inboxes/Edit.vue
    render inertia: "Inboxes/Edit"
  end

  def update
    redirect_to inboxes_url
  end

  def destroy
    redirect_to inboxes_url
  end
end
