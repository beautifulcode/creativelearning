require "#{File.dirname(__FILE__)}/../test_helper"

class TestCurrentRegistrationFormTest < ActionController::IntegrationTest
  # fixtures :your, :models

  def test_registration_link
    get "/registration"
    assert_response :success
  end
end
