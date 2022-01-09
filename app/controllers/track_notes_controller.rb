class TrackNotesController < ApplicationController
  before_action :set_track_note, only: %i[ show edit update destroy ]

  # GET /track_notes or /track_notes.json
  def index
    @track_notes = TrackNote.all
  end

  # GET /track_notes/1 or /track_notes/1.json
  def show
  end

  # GET /track_notes/new
  def new
    @track_note = TrackNote.new
    @arrayOfMusicTrackIds = []
    MusicTrack.find_each do |track|
      @arrayOfMusicTrackIds << [track.name,track.id]
    end
    print("-----------------------array of music track ids: \n")
    print(@arrayOfMusicTrackIds)
  end

  # GET /track_notes/1/edit
  def edit
    @arrayOfMusicTrackIds = []
    MusicTrack.find_each do |track|
      @arrayOfMusicTrackIds << [track.name,track.id]
    end
    print("-----------------------array of music track ids: \n")
    print(@arrayOfMusicTrackIds)
  end

  # POST /track_notes or /track_notes.json
  def create
    # @track_note = TrackNote.new(track_note_params)
    @track_note = TrackNote.find_by(user_id: track_note_params[:user_id], music_track_id: track_note_params[:music_track_id])

    respond_to do |format|
      # If TrackNote with the specified user_id and music_track_id do not exist, new TrackNote with the given values
      if (@track_note)
        format.html { redirect_to track_note_url(@track_note), notice: "Track note already exists." }
        format.json { render :show, status: :not_modified, location: @track_note }
      else
        @track_note = TrackNote.new(track_note_params)
        if @track_note.save
          format.html { redirect_to track_note_url(@track_note), notice: "Track note was successfully created." }
          format.json { render :show, status: :created, location: @track_note }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @track_note.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /track_notes/1 or /track_notes/1.json
  def update
    respond_to do |format|
      if @track_note.update(track_note_params)
        format.html { redirect_to track_note_url(@track_note), notice: "Track note was successfully updated." }
        format.json { render :show, status: :ok, location: @track_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @track_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /track_notes/1 or /track_notes/1.json
  def destroy
    @track_note.destroy

    respond_to do |format|
      format.html { redirect_to track_notes_url, notice: "Track note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track_note
      @track_note = TrackNote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_note_params
      params.require(:track_note).permit(:music_track_id, :body, :user_id)
    end
end
