require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get post" do
    get :post
    assert_response :success
  end

  test "should get all_posts" do
    get :all_posts
    assert_response :success
  end

  test "should get posts_by_plate" do
    get :posts_by_plate
    assert_response :success
  end

  test "should get posts_by_user" do
    get :posts_by_user
    assert_response :success
  end

  test "should get followed_posts" do
    get :followed_posts
    assert_response :success
  end

end
