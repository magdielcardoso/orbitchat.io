class ContactsController < ApplicationController
  def index
    render :index
  end

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    redirect_to contacts_url
  end

  def edit
    render :edit
  end

  def update
    redirect_to contacts_url
  end

  def destroy
    redirect_to contacts_url
  end
end
