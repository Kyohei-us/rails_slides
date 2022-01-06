require "application_system_test_case"

class TrackNotesTest < ApplicationSystemTestCase
  setup do
    @track_note = track_notes(:one)
  end

  test "visiting the index" do
    visit track_notes_url
    assert_selector "h1", text: "Track Notes"
  end

  test "creating a Track note" do
    visit track_notes_url
    click_on "New Track Note"

    fill_in "Body", with: @track_note.body
    fill_in "Music track", with: @track_note.music_track_id
    fill_in "User", with: @track_note.user_id
    click_on "Create Track note"

    assert_text "Track note was successfully created"
    click_on "Back"
  end

  test "updating a Track note" do
    visit track_notes_url
    click_on "Edit", match: :first

    fill_in "Body", with: @track_note.body
    fill_in "Music track", with: @track_note.music_track_id
    fill_in "User", with: @track_note.user_id
    click_on "Update Track note"

    assert_text "Track note was successfully updated"
    click_on "Back"
  end

  test "destroying a Track note" do
    visit track_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Track note was successfully destroyed"
  end
end
