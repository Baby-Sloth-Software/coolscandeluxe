class ProductController < ApplicationController
  def index
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name],
      quantity: params[:quantity].to_i,
      rvalue: params[:rvalue].to_i,
      gvalue: params[:gvalue].to_i,
      bvalue: params[:bvalue].to_i)
    if @product.save
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
