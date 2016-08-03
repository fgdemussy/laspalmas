class VisitsController < ApplicationController
  def create
    @raider = Raider.find params[:raider_id]
    if @raider.visits.find_by_date(Date.today).blank?
      @visit = Visit.new date: Date.today
      @raider.visits << @visit
    end
    respond_to do |format|
      format.html { redirect_to(user_signed_in? ? @raider : go_ride_raider_path(@raider), notice: "Visit logged.") }
    end
  end

  def destroy
    @visit = Visit.find params[:id]
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to raider_path(params[:raider_id]), notice: 'Visit was successfully destroyed.' }
    end
  end
end
