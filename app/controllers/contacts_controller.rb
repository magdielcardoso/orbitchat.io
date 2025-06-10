class ContactsController < ApplicationController
  def index
    # TODO: Criar página Vue correspondente em app/frontend/pages/Contacts/Index.vue
    render inertia: "Contacts/Index"
  end

  def show
    # TODO: Criar página Vue correspondente em app/frontend/pages/Contacts/Show.vue
    render inertia: "Contacts/Show"
  end

  def new
    # TODO: Criar página Vue correspondente em app/frontend/pages/Contacts/New.vue
    render inertia: "Contacts/New"
  end

  def create
    redirect_to contacts_url
  end

  def edit
    # TODO: Criar página Vue correspondente em app/frontend/pages/Contacts/Edit.vue
    render inertia: "Contacts/Edit"
  end

  def update
    redirect_to contacts_url
  end

  def destroy
    redirect_to contacts_url
  end
end
