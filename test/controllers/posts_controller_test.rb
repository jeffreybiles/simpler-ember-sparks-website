require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:posts)
  # end
  #
  # test "should show post" do
  #   get :show, id: @post.id
  #   assert_response :success
  # end
end
