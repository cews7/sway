class TrackersController < ApplicationController
  def index
    redirect_to login_path unless current_user
  end

  def new
    @tracker = Tracker.new
  end

  def create
    @tracker = Tracker.new(tracker_params)
    if @tracker.save
      redirect_to tracker_path(@tracker)
    else
      flash[:error] = @tracker.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @tracker = Tracker.find(params[:id])
  end

  private

  def tracker_params
    params.require(:tracker).permit(:name, :purpose)
  end
end
