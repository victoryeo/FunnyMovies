class VideosController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_video, only: [:show, :edit, :like, :dislike]
  # All published videos
  def index
	  @videos = Video.all
  end
  def show
    @videos = Video.find(params[:id])
    Rails.logger.debug("video show #{@videos.attributes.inspect}")
  end
  def new
    Rails.logger.debug("video new")
    @video = Video.new
  end
  def edit
  end
  def create
    Rails.logger.debug("video create")
    @video = Video.new(video_params)
    @video.user_id = current_user.id
    # thumbnail root_url
    urlname = @video.video_url.gsub(/http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=)/,'\1')
    Rails.logger.debug("#{urlname}")
    @video.thumbnail_url = "http://img.youtube.com/vi/" + urlname + "/default.jpg"
    @video.video_url = "https://www.youtube.com/embed/" + urlname
    respond_to do |format|
      if @video.save!
        Rails.logger.debug("video save")
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        Rails.logger.debug("video error")
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end
  # Likes video, increment likes count
  def like
    @video.like!
  end
  # Dislikes video, increment likes count
  def dislike
    @video.dislike!
  end
  private
  def set_video
    Rails.logger.debug(params[:id])
    if params[:id].to_i.to_s == params[:id]
      @video = Video.find(params[:id])
    else
      params[:id] = "1"
      Rails.logger.debug("video nil")
    end
  end
  def video_params
    params.require(:video).permit(:video_url, :name)
  end
end
