class ProductController < ApplicationController
  def index
    @product = Product.joins(:category).all
  end

  def show
    @product = Product.joins(:category).find(params[:id])
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.all
  end

  def create
    @product = Product.create(name:params[:name], description:params[:description], pricing:params[:pricing], category_id:params[:category])
    redirect_to '/product/index'
  end

  def update
    @product = Product.find(params[:id]).update(name:params[:name], description:params[:description], pricing:params[:pricing], category_id:params[:category])
    redirect_to '/product/index'
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to '/product/index'
  end

  def commentCreate
    @comment = Comment.create(comment:params[:comment], product_id:params[:id])
    redirect_to '/product/' + params[:id] + '/show'
  end

  def allComments
     @comment = Comment.joins(:product).all

  end
end
