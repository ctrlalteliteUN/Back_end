require 'test_helper'

class AppFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_file = app_files(:one)
  end

  test "should get index" do
    get app_files_url, as: :json
    assert_response :success
  end

  test "should create app_file" do
    assert_difference('AppFile.count') do
      post app_files_url, params: { app_file: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show app_file" do
    get app_file_url(@app_file), as: :json
    assert_response :success
  end

  test "should update app_file" do
    patch app_file_url(@app_file), params: { app_file: {  } }, as: :json
    assert_response 200
  end

  test "should destroy app_file" do
    assert_difference('AppFile.count', -1) do
      delete app_file_url(@app_file), as: :json
    end

    assert_response 204
  end
end
