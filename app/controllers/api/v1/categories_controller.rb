module Api
	module V1
		class CategoriesController < BaseController
      # before_action :authenticate!
  		before_action :set_category, only: [:show, :edit, :update, :destroy]
  # GET /categorys
  # GET /categorys.json
  def index
    categories = Category.all
    render json: {status: 'SUCCESS', message: 'Loaded Categories', data: categories},status: :ok
  end

  # GET /categorys/1
  # GET /categorys/1.json
  def show
    category = Category.find_by_id(params[:id])
    post = Post.where(category: category.id) #all posts associated with the category
    render json: {status: 'SUCCESS', message: 'Loaded Category', data: category},status: :ok 
  end

  # GET /categorys/new
  def new
    category = Category.new
  end

  # category /categorys
  # category /categorys.json
  def create
    category = Category.new(category_params)
      if category.save
        render json: {status: 'SUCCESS', message: 'Category Saved', data: category},status: :ok 
      else
        render json: {status: 'ERRORS', errors: 'Category Not Saved', data: category.errors},status: :unprocessable_entity 
      end
  end

  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.permit(:category_title, :category_description)
    end
end

	end
end
