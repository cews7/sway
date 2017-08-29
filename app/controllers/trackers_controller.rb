class TrackersController < ApplicationController
  def index
    redirect_to login_path unless current_user
  end

  def new
    @tracker = Tracker.new
  end
end
