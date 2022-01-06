require "test_helper"

class MusicTracksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_track = music_tracks(:one)
  end

  test "should get index" do
    get music_tracks_url
    assert_response :success
  end

  test "should get new" do
    get new_music_track_url
    assert_response :success
  end

  test "should create music_track" do
    assert_difference('MusicTrack.count') do
      post music_tracks_url, params: { music_track: { name: @music_track.name, spotifyURI: @music_track.spotifyURI } }
    end

    assert_redirected_to music_track_url(MusicTrack.last)
  end

  test "should show music_track" do
    get music_track_url(@music_track)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_track_url(@music_track)
    assert_response :success
  end

  test "should update music_track" do
    patch music_track_url(@music_track), params: { music_track: { name: @music_track.name, spotifyURI: @music_track.spotifyURI } }
    assert_redirected_to music_track_url(@music_track)
  end

  test "should destroy music_track" do
    assert_difference('MusicTrack.count', -1) do
      delete music_track_url(@music_track)
    end

    assert_redirected_to music_tracks_url
  end
end
