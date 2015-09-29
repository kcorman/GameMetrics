require 'test_helper'

class PlaySessionsControllerTest < ActionController::TestCase
  setup do
    @play_session = play_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_session" do
    assert_difference('PlaySession.count') do
      post :create, play_session: { game_id: @play_session.game_id, game_name: @play_session.game_name, version_id: @play_session.version_id }
    end

    assert_redirected_to play_session_path(assigns(:play_session))
  end

  test "should show play_session" do
    get :show, id: @play_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @play_session
    assert_response :success
  end

  test "should update play_session" do
    patch :update, id: @play_session, play_session: { game_id: @play_session.game_id, game_name: @play_session.game_name, version_id: @play_session.version_id }
    assert_redirected_to play_session_path(assigns(:play_session))
  end

  test "should destroy play_session" do
    assert_difference('PlaySession.count', -1) do
      delete :destroy, id: @play_session
    end

    assert_redirected_to play_sessions_path
  end
end
