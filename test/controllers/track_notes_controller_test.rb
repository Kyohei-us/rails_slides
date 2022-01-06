require "test_helper"

class TrackNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @track_note = track_notes(:one)
  end

  test "should get index" do
    get track_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_track_note_url
    assert_response :success
  end

  test "should create track_note" do
    assert_difference('TrackNote.count') do
      post track_notes_url, params: { track_note: { body: @track_note.body, music_track_id: @track_note.music_track_id, user_id: @track_note.user_id } }
    end

    assert_redirected_to track_note_url(TrackNote.last)
  end

  test "should show track_note" do
    get track_note_url(@track_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_track_note_url(@track_note)
    assert_response :success
  end

  test "should update track_note" do
    patch track_note_url(@track_note), params: { track_note: { body: @track_note.body, music_track_id: @track_note.music_track_id, user_id: @track_note.user_id } }
    assert_redirected_to track_note_url(@track_note)
  end

  test "should destroy track_note" do
    assert_difference('TrackNote.count', -1) do
      delete track_note_url(@track_note)
    end

    assert_redirected_to track_notes_url
  end
end
