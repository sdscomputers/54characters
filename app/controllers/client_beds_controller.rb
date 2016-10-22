class ClientBedsController < ApplicationController
  before_action :set_client_bed, only: [:show, :edit, :update, :destroy]

  # GET /client_beds
  # GET /client_beds.json
  def index
    @client_beds = ClientBed.all
  end

  # GET /client_beds/1
  # GET /client_beds/1.json
  def show
  end

  # GET /client_beds/new
  def new
    @client_bed = ClientBed.new
  end

  # GET /client_beds/1/edit
  def edit
  end

  # POST /client_beds
  # POST /client_beds.json
  def create
    @client_bed = ClientBed.new(client_bed_params)

    respond_to do |format|
      if @client_bed.save
        format.html { redirect_to @client_bed, notice: 'Client bed was successfully created.' }
        format.json { render :show, status: :created, location: @client_bed }
      else
        format.html { render :new }
        format.json { render json: @client_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_beds/1
  # PATCH/PUT /client_beds/1.json
  def update
    respond_to do |format|
      if @client_bed.update(client_bed_params)
        format.html { redirect_to @client_bed, notice: 'Client bed was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_bed }
      else
        format.html { render :edit }
        format.json { render json: @client_bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_beds/1
  # DELETE /client_beds/1.json
  def destroy
    @client_bed.destroy
    respond_to do |format|
      format.html { redirect_to client_beds_url, notice: 'Client bed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_bed
      @client_bed = ClientBed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_bed_params
      params.fetch(:client_bed, {})
    end
end
