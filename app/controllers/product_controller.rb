class ProductController < ApplicationController
  
  def index
    
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new( name: params[:name],
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

  def edit
  end

  def update
  end

  def destroy
    product = Product.find(params[:id])
    flash[:notice] = "The product has been removed from the inventory list."
    product.destroy
  end
  redirect_to products_path
end
