class LiabilitiesController < ApplicationController
  before_action :set_liability, only: [:show, :edit, :update, :destroy]

  # GET /liabilities
  # GET /liabilities.json
  def index
    @liabilities = Liability.all
  end

  # GET /liabilities/1
  # GET /liabilities/1.json
  def show
    @liability = Liability.find(params[:id])
  end

  # GET /liabilities/new
  def new
    @liability = Liability.new
  end

  # GET /liabilities/1/edit
  def edit
  end

  # POST /liabilities
  # POST /liabilities.json
  def create
    binding.pry
    @liability = Liability.new(liability_params)

    respond_to do |format|
      if @liability.save
        format.html { redirect_to @liability, notice: 'Liability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @liability }
      else
        format.html { render action: 'new' }
        format.json { render json: @liability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liabilities/1
  # PATCH/PUT /liabilities/1.json
  def update
    respond_to do |format|
      if @liability.update(liability_params)
        format.html { redirect_to @liability, notice: 'Liability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @liability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liabilities/1
  # DELETE /liabilities/1.json
  def destroy
    @liability.destroy
    respond_to do |format|
      format.html { redirect_to liabilities_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_liability
      @liability = Liability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liability_params
      params.require(:liability).permit(:item, :property, :money,
        heirships_attributes: [ :transfer_date, { person: :name } ])
    end
  end
