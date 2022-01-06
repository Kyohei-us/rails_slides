require "application_system_test_case"

class MusicTracksTest < ApplicationSystemTestCase
  setup do
    @music_track = music_tracks(:one)
  end

  test "visiting the index" do
    visit music_tracks_url
    assert_selector "h1", text: "Music Tracks"
  end

  test "creating a Music track" do
    visit music_tracks_url
    click_on "New Music Track"

    fill_in "Name", with: @music_track.name
    fill_in "Spotifyuri", with: @music_track.spotifyURI
    click_on "Create Music track"

    assert_text "Music track was successfully created"
    click_on "Back"
  end

  test "updating a Music track" do
    visit music_tracks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @music_track.name
    fill_in "Spotifyuri", with: @music_track.spotifyURI
    click_on "Update Music track"

    assert_text "Music track was successfully updated"
    click_on "Back"
  end

  test "destroying a Music track" do
    visit music_tracks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Music track was successfully destroyed"
  end
end
