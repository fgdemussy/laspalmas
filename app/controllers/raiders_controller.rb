class RaidersController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :create, :go_ride]
  before_action :set_raider, only: [:show, :edit, :update, :destroy, :go_ride]

  helper_method :sort_column, :sort_direction

  def welcome
    logger.debug notice

    if params[:raider].blank?
      @raider = Raider.new
    else
      @raider = Raider.find_by_rut(raider_params[:rut])
    end

    respond_to do |format|
      if @raider.nil?
        @raider = Raider.new rut: raider_params[:rut]
        @raider.valid?
        if @raider.errors[:rut].blank?
          @raider.errors.clear
          flash.now[:notice] = "Welcome new rider! Please fill in the blanks."
          format.html { render :new }
        else
          @notice = "Snap! Invalid RUT. Please try again."
          @alert_class = "alert-danger"
          format.html { render :welcome }
        end

      elsif @raider.new_record?
        format.html { render :welcome }
      else
        format.html { redirect_to user_signed_in? ? @raider : go_ride_raider_path(@raider) }
      end
    end
  end

  # GET /raiders
  # GET /raiders.json
  def index
    @raiders = Raider.order(sort_column.to_sym => sort_direction.to_sym).page(params[:page])

    respond_to do |format|
      format.html
      format.xlsx {
        @raiders = Raider.all.order('"lastName"')
        response.headers['Content-Disposition'] = 'attachment; filename="all_riders.xlsx"'
      }
    end
  end

  # GET /raiders/1
  # GET /raiders/1.json
  def show
    @not_visited_today = @raider.visits.find_by_date(Date.today).blank?
  end

  # GET /raiders/1/go_ride
  def go_ride
    @not_visited_today = @raider.visits.find_by_date(Date.today).blank?
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
        @raider.visits << Visit.new(date: Date.today)
        format.html { redirect_to root_url, notice: "Okay #{@raider.name}, you have successfully registered. Go ride!" }
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
        format.html { redirect_to raiders_url, notice: 'Rider was successfully updated.' }
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
      format.html { redirect_to raiders_url, notice: 'Rider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sortable columns
    def sort_column
      Raider.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    # Sort direction
    def sort_direction
      unless params[:direction].nil?
        %[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      else
        "asc"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_raider
      @raider = Raider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raider_params
      params.require(:raider).permit(:name, :lastName, :rut, :acceptedTerms, :email, :birthdate, :city_id)
    end
end
