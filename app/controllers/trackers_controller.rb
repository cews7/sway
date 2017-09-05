class TrackersController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @trackers = current_user.trackers
  end

  def new
    @tracker = Tracker.new
  end

  def create
    @tracker = Tracker.new(tracker_params)
    @partner = User.find_by_email(params[:tracker][:partner_email])
    if @partner.present?
      if @tracker.save
        current_user.trackers << @tracker
        @partner.trackers << @tracker
        redirect_to tracker_path(@tracker)
      else
        flash[:error] = @tracker.errors.full_messages.to_sentence
        render :new
      end
    else
      flash[:error] = "#{params[:tracker][:partner_email]} does not exist, please input valid email"
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
