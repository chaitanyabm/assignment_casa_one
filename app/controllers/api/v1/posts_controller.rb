class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    
    posts = current_user.posts.all
    render json: {status: 'SUCCESS', message: 'Loaded Posts', data: posts},status: :ok
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    post = Post.find_by_id(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded Post', data: post},status: :ok 
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:category, :title, :description, :user_id)
    end
end
