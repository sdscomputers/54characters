class ClientSearchController < ApplicationController
  def new

  end

  def create
    @clients = ClientSearch.new(params[:search]).find_clients
  end
end
