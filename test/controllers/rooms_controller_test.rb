require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get listing" do
    get rooms_listing_url
    assert_response :success
  end

  test "should get price" do
    get rooms_price_url
    assert_response :success
  end

  test "should get description" do
    get rooms_description_url
    assert_response :success
  end

  test "should get photos" do
    get rooms_photos_url
    assert_response :success
  end

  test "should get amenities" do
    get rooms_amenities_url
    assert_response :success
  end

  test "should get location" do
    get rooms_location_url
    assert_response :success
  end

end
