require 'test_helper'

class RegistrantsControllerTest < ActionController::TestCase

  test "create adds a registrant" do
    assert_difference('Registrant.count') do
      post :create, registrant: registrant.as_json
    end
  end

  test "can post to create" do
    post :create, registrant: registrant.as_json
    assert_response :success
  end

  test "create returns json with template" do
    post :create, registrant: registrant.as_json
    json = json_response
    assert json["template"].present?
    assert json["status"].present?
  end

  test "create returns json negative status when invalid" do
    post :create, registrant: invalid_registrant.as_json
    assert_equal "failure", json_response["status"]
  end

  private

  def registrant
    FactoryGirl.build(:registrant)
  end

  def invalid_registrant
    registrant.tap do |r|
      r.name = nil
    end
  end

end
