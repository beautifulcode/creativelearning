require File.dirname(__FILE__) + '/../test_helper'
require 'policies_controller'

# Re-raise errors caught by the controller.
class PoliciesController; def rescue_action(e) raise e end; end

class PoliciesControllerTest < Test::Unit::TestCase
  def setup
    @controller = PoliciesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
