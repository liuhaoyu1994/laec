class ResearchPartnersController < ApplicationController
  before_action :set_research_partner, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /research_partners
  # GET /research_partners.json
  def index
    @research_partners = ResearchPartner.all
  end

  # GET /research_partners/1
  # GET /research_partners/1.json
  def show
  end

  # GET /research_partners/new
  def new
    @research_partner = ResearchPartner.new
  end

  # GET /research_partners/1/edit
  def edit
  end

  # POST /research_partners
  # POST /research_partners.json
  def create
    @research_partner = ResearchPartner.new(research_partner_params)

    respond_to do |format|
      if @research_partner.save
        format.html { redirect_to @research_partner, notice: 'Research partner was successfully created.' }
        format.json { render :show, status: :created, location: @research_partner }
      else
        format.html { render :new }
        format.json { render json: @research_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_partners/1
  # PATCH/PUT /research_partners/1.json
  def update
    respond_to do |format|
      if @research_partner.update(research_partner_params)
        format.html { redirect_to @research_partner, notice: 'Research partner was successfully updated.' }
        format.json { render :show, status: :ok, location: @research_partner }
      else
        format.html { render :edit }
        format.json { render json: @research_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_partners/1
  # DELETE /research_partners/1.json
  def destroy
    @research_partner.destroy
    respond_to do |format|
      format.html { redirect_to research_partners_url, notice: 'Research partner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_partner
      @research_partner = ResearchPartner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_partner_params
      params.require(:research_partner).permit(:title, :description, :image)
    end
end
