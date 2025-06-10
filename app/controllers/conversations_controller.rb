class ConversationsController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Conversations/Index.vue
    render inertia: "Conversations/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Conversations/Show.vue
    render inertia: "Conversations/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Conversations/New.vue
    render inertia: "Conversations/New"
  end

  def create
    redirect_to conversations_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Conversations/Edit.vue
    render inertia: "Conversations/Edit"
  end

  def update
    redirect_to conversations_url
  end

  def destroy
    redirect_to conversations_url
  end
end
