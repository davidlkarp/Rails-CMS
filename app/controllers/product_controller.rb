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
end
