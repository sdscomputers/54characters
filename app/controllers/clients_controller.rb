class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find params[:id]
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find parmas[:id]
  end

  def create
    @client = Client.new client_params
    if @client.save
      redirect_to client_path(@client.id), success: 'Save Successful'
    else
      render :new
    end
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes client_params
      redirect_to client_path(@client.id), success: 'Save Sucessful'
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find params[:id]
    @client.destroy
    redirect_to clients_path, success: 'Destroy Successful'
  end
end
