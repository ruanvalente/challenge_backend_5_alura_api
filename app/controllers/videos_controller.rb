class VideosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :video_not_found
  before_action :set_video, only: %i[ show update destroy ]

  # GET /videos
  def index
    @videos = Video.all

    render json: @videos
  end

  # GET /videos/1
  def show
    @video = Video.find(params[:id])
    render json: @video, status: :ok
    rescue ActiveRecord::RecordNotFound => error 
      puts error
      render json: { error: error.message }, status: :not_found
  end

  # POST /videos
  def create
    @video = Video.new(video_params)

    if @video.save
      render json: @video, status: :created, location: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      render json: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def video_not_found
      render json: { error: "Video not found" }, status: :not_found
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description, :url)
    end
end
