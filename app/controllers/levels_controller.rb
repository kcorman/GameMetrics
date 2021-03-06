class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
  end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(level_params)
    sess = PlaySession.where(id:@level.session_id).first
    if(!sess)
        render :status => :bad_request, :text => "Unknown session" and return
    end
    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Level was successfully created.' }
        format.json { render action: 'show', status: :created, location: @level }
      else
        format.html { render action: 'new' }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    respond_to do |format|
      @level = Level.where(:id => params[:id])
      if(@level.nil?)
        render :status => :not_found, :text => "Unknown level" and return
      end
      if @level.update(level_params)
        format.html { redirect_to @level, notice: 'Level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to levels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      #params.require(:level).permit(:session_id, :data, :actions, :version)
      #I'm going to hell for this
      params.require(:level).permit!
    end
end
