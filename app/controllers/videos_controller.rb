class VideosController < ApplicationController
  include VideosHelper

  rescue_from ActiveRecord::RecordNotFound, with: :video_not_found
  before_action :set_video, only: %i[show update destroy]

  # GET /videos
  def index
    if params[:search]
      @videos = VideoSearch.new(params[:search]).result
      render json: { videos: @videos }, status: :ok
    else
      @videos = Video.order(created_at: :desc)
      pagination = paginate(@videos, page: params[:page])
      render json: { videos: pagination[:items], meta: { total_pages: pagination[:total_pages], current_page: pagination[:current_page] } }, status: :ok
    end
  end

  # GET /videos/1
  def show
    @video = Video.find(params[:id])
    render json: @video, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
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
    render json: { error: 'Video not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.require(:video).permit(:title, :description, :url, :category_id)
  end
end
