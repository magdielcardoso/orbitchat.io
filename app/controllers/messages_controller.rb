class MessagesController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Messages/Index.vue
    render inertia: "Messages/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Messages/Show.vue
    render inertia: "Messages/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Messages/New.vue
    render inertia: "Messages/New"
  end

  def create
    redirect_to messages_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Messages/Edit.vue
    render inertia: "Messages/Edit"
  end

  def update
    redirect_to messages_url
  end

  def destroy
    redirect_to messages_url
  end
end
