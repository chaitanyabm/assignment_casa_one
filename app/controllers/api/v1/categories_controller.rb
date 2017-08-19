module Api
	module V1
		class CategoriesController < ApplicationController
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
    @posts = Post.where(category: 1) #all posts associated with the category
  end

  # GET /categorys/new
  def new
    @category = Category.new
    
  end

  # GET /categorys/1/edit
  def edit
  end

  # category /categorys
  # category /categorys.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorys/1
  # PATCH/PUT /categorys/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_title, :category_description)
    end
end

	end
end
