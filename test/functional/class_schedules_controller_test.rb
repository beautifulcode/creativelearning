require File.dirname(__FILE__) + '/../test_helper'

class ClassSchedulesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:class_schedules)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_class_schedule
    assert_difference('ClassSchedule.count') do
      post :create, :class_schedule => { }
    end

    assert_redirected_to class_schedule_path(assigns(:class_schedule))
  end

  def test_should_show_class_schedule
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_class_schedule
    put :update, :id => 1, :class_schedule => { }
    assert_redirected_to class_schedule_path(assigns(:class_schedule))
  end

  def test_should_destroy_class_schedule
    assert_difference('ClassSchedule.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to class_schedules_path
  end
end
