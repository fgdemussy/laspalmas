class RaidersController < ApplicationController
  before_action :set_raider, only: [:show, :edit, :update, :destroy]

  # GET /raiders
  # GET /raiders.json
  def index
    @raiders = Raider.all.order('lower("lastName")')
  end

  # GET /raiders/1
  # GET /raiders/1.json
  def show
  end

  # GET /raiders/new
  def new
    @raider = Raider.new
  end

  # GET /raiders/1/edit
  def edit
  end

  # POST /raiders
  # POST /raiders.json
  def create
    @raider = Raider.new(raider_params)

    respond_to do |format|
      if @raider.save
        format.html { redirect_to @raider, notice: 'Raider was successfully created.' }
        format.json { render :show, status: :created, location: @raider }
      else
        format.html { render :new }
        format.json { render json: @raider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raiders/1
  # PATCH/PUT /raiders/1.json
  def update
    respond_to do |format|
      if @raider.update(raider_params)
        format.html { redirect_to @raider, notice: 'Raider was successfully updated.' }
        format.json { render :show, status: :ok, location: @raider }
      else
        format.html { render :edit }
        format.json { render json: @raider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raiders/1
  # DELETE /raiders/1.json
  def destroy
    @raider.destroy
    respond_to do |format|
      format.html { redirect_to raiders_url, notice: 'Raider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raider
      @raider = Raider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raider_params
      params.require(:raider).permit(:name, :lastName, :rut, :acceptedTerms)
    end
end
