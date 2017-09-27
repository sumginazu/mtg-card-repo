class CardInstancesController < ApplicationController
  before_action :set_card_instance, only: [:show, :edit, :update, :destroy]

  # GET /card_instances
  # GET /card_instances.json
  def index
    @card_instances = CardInstance.all
  end

  # GET /card_instances/1
  # GET /card_instances/1.json
  def show
  end

  # GET /card_instances/new
  def new
    @card_instance = CardInstance.new
  end

  # GET /card_instances/1/edit
  def edit
  end

  # POST /card_instances
  # POST /card_instances.json
  def create
    @card_instance = CardInstance.new(card_instance_params)

    respond_to do |format|
      if @card_instance.save
        format.html { redirect_to @card_instance, notice: 'Card owner was successfully created.' }
        format.json { render :show, status: :created, location: @card_instance }
      else
        format.html { render :new }
        format.json { render json: @card_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_instances/1
  # PATCH/PUT /card_instances/1.json
  def update
    respond_to do |format|
      if @card_instance.update(card_instance_params)
        format.html { redirect_to @card_instance, notice: 'Card owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_instance }
      else
        format.html { render :edit }
        format.json { render json: @card_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_instances/1
  # DELETE /card_instances/1.json
  def destroy
    @card_instance.destroy
    respond_to do |format|
      format.html { redirect_to card_instances_url, notice: 'Card owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_instance
      @card_instance = CardInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_instance_params
      params.fetch(:card_instance, {})
    end
end
