class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.joins(:users).where('user_activities.user_id IS NOT NULL').all.sort_by{|a| a.users.size }.reverse
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activity_params
    params.require(:activity).permit(:name, :description, :type)
  end
end
