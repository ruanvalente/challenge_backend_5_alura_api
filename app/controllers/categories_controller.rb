class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :category_not_found
  before_action :set_category, only: %i[show update destroy]

  # GET /categories
  def index
    @categories = Category.order(created_at: :desc)

    render json: @categories
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    render json: @category, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.message }, status: :not_found
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def videos
    category = Category.find(params[:id])
    videos = category.videos.order(created_at: :desc)
    render json: { videos: videos }
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def category_not_found
    render json: { error: 'Category not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title, :color)
  end
end
