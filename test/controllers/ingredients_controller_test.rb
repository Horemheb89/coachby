require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ingredients_create_url
    assert_response :success
  end

  test "should get new" do
    get ingredients_new_url
    assert_response :success
  end

end
