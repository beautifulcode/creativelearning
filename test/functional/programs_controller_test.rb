require File.dirname(__FILE__) + '/../test_helper'
require 'programs_controller'

# Re-raise errors caught by the controller.
class ProgramsController; def rescue_action(e) raise e end; end

class ProgramsControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProgramsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
