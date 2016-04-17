class InvupdatesController < ApplicationController
  before_action :set_invupdate, only: [:show, :edit, :update, :destroy]

  def index
    @invupdates = Invupdate.all
  end

  def show
    #@invupdate = Invupdate.find_by(params[:id])
  end

  def new
    @invupdate = Invupdate.new
  end

  def edit
  end

  def create
    @invupdate = Invupdate.new(invupdate_params)
    @invupdate.save
    product_color = Product.find_product_by_range(invupdate_params)
    @product = Product.find_by_color(product_color)
    @product.quantity -= 1 unless @product.nil?
    @product.save unless @product.nil?
    #Define our value ranges
    #Determine what color values are recieved
    #compare them to our defined ranges
    #return a color
    #(@invupdate.c_value == int && @invupdate.r_value == int && @invupdate.g_value == int && @invupdate.b_value == int)
    # find product by color and subtract 1 from quantity
    # if (@invupdate.c_value == [3301..3800])
    #   color = "red"
    # elsif (@invupdate.c_value == [2800..3299])
    #   color = "green"
    # elsif (@invupdate.c_value == [5700..6400])
    #   color = "blue"
    # end
    # product = Product.find_by(color: color)
    # product.update(quantity: product.quantity - 1 )

    # respond_to do |format|
    #   if @invupdate.save
    #     #format.html { notice: 'Invupdate was successfully created.' }
    #     format.json { render :show, status: :created, location: @invupdate }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @invupdate.errors, status: :unprocessable_entity }
    #   end
    render "show.json.jbuilder", status: :created
    end
  end

  def update
    respond_to do |format|
      if @invupdate.update(invupdate_params)
        format.html { redirect_to @invupdate, notice: 'Invupdate was successfully updated.' }
        format.json { render :show, status: :ok, location: @invupdate }
      else
        format.html { render :edit }
        format.json { render json: @invupdate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invupdate.destroy
    respond_to do |format|
      format.html { redirect_to invupdates_url, notice: 'Invupdate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invupdate
      @invupdate = Invupdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invupdate_params
      params.fetch(:invupdate, {})
      params.permit(:unit_id, :c_value, :r_value, :g_value, :b_value)
    end

