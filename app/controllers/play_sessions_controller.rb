class PlaySessionsController < ApplicationController
  before_action :set_play_session, only: [:show, :edit, :update, :destroy]

  # GET /play_sessions
  # GET /play_sessions.json
  def index
    @play_sessions = PlaySession.all
  end

  # GET /play_sessions/1
  # GET /play_sessions/1.json
  def show
  end

  # GET /play_sessions/new
  def new
    @play_session = PlaySession.new
  end

  # GET /play_sessions/1/edit
  def edit
  end

  # POST /play_sessions
  # POST /play_sessions.json
  def create
    @play_session = PlaySession.new(play_session_params)

    respond_to do |format|
      if @play_session.save
        format.html { redirect_to @play_session, notice: 'Play session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @play_session }
      else
        format.html { render action: 'new' }
        format.json { render json: @play_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /play_sessions/1
  # PATCH/PUT /play_sessions/1.json
  def update
    respond_to do |format|
      @play_session = PlaySession.where(:id => params[:id]).first
      if(@play_session.nil?)
        render :status => :not_found, :text => "Unknown session" and return
      end
      closing = play_session_params[:closed_on]
      if(closing)
          play_session_params[:length] = DateTime.parse(closing).to_i - @play_session.created_at.to_i
      end
      # Check if they're closing. If so replace close with closed_on and the current time 
      if @play_session.update(play_session_params)
        format.html { redirect_to @play_session, notice: 'Play session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @play_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /play_sessions/1
  # DELETE /play_sessions/1.json
  def destroy
    @play_session.destroy
    respond_to do |format|
      format.html { redirect_to play_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play_session
      @play_session = PlaySession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_session_params
      #params.require(:play_session).permit(:game_name, :game_id, :version_id, :data, :app_id)
      params.require(:play_session).permit!
    end
end
