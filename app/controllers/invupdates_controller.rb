class InvupdatesController < ApplicationController
  before_action :set_invupdate, only: [:show, :edit, :update, :destroy]

  # GET /invupdates
  # GET /invupdates.json
  def index
    @invupdates = Invupdate.all
  end

  # GET /invupdates/1
  # GET /invupdates/1.json
  def show
  end

  # GET /invupdates/new
  def new
    @invupdate = Invupdate.new
  end

  # GET /invupdates/1/edit
  def edit
  end

  # POST /invupdates
  # POST /invupdates.json
  def create
    @invupdate = Invupdate.new(invupdate_params)

    respond_to do |format|
      if @invupdate.save
        format.html { redirect_to @invupdate, notice: 'Invupdate was successfully created.' }
        format.json { render :show, status: :created, location: @invupdate }
      else
        format.html { render :new }
        format.json { render json: @invupdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invupdates/1
  # PATCH/PUT /invupdates/1.json
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

  # DELETE /invupdates/1
  # DELETE /invupdates/1.json
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
    end
end
