require File.dirname(__FILE__) + '/../test_helper'

class RegistrationFormsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_forms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_registration_form
    assert_difference('RegistrationForm.count') do
      post :create, :registration_form => { }
    end

    assert_redirected_to registration_form_path(assigns(:registration_form))
  end

  def test_should_show_registration_form
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_registration_form
    put :update, :id => 1, :registration_form => { }
    assert_redirected_to registration_form_path(assigns(:registration_form))
  end

  def test_should_destroy_registration_form
    assert_difference('RegistrationForm.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to registration_forms_path
  end
end
