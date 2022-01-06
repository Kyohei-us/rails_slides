class MusicTracksController < ApplicationController
  before_action :set_music_track, only: %i[ show edit update destroy ]

  # GET /music_tracks or /music_tracks.json
  def index
    @music_tracks = MusicTrack.all
  end

  # GET /music_tracks/1 or /music_tracks/1.json
  def show
  end

  # GET /music_tracks/new
  def new
    @music_track = MusicTrack.new
  end

  # GET /music_tracks/1/edit
  def edit
  end

  # POST /music_tracks or /music_tracks.json
  def create
    @music_track = MusicTrack.new(music_track_params)

    respond_to do |format|
      if @music_track.save
        format.html { redirect_to music_track_url(@music_track), notice: "Music track was successfully created." }
        format.json { render :show, status: :created, location: @music_track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @music_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /music_tracks/1 or /music_tracks/1.json
  def update
    respond_to do |format|
      if @music_track.update(music_track_params)
        format.html { redirect_to music_track_url(@music_track), notice: "Music track was successfully updated." }
        format.json { render :show, status: :ok, location: @music_track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @music_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /music_tracks/1 or /music_tracks/1.json
  def destroy
    @music_track.destroy

    respond_to do |format|
      format.html { redirect_to music_tracks_url, notice: "Music track was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music_track
      @music_track = MusicTrack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def music_track_params
      params.require(:music_track).permit(:name, :spotifyURI)
    end
end
