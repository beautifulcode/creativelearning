require File.dirname(__FILE__) + '/../test_helper'

class TestimonialsControllerTest < ActionController::TestCase
  fixtures :testimonials
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:testimonials)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_testimonial
    assert_difference('Testimonial.count') do
      post :create, :testimonial => { }
    end

    assert_redirected_to testimonial_path(assigns(:testimonial))
  end

  def test_should_show_testimonial
    get :show, :id => testimonials(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => testimonials(:one).id
    assert_response :success
  end

  def test_should_update_testimonial
    put :update, :id => testimonials(:one).id, :testimonial => { }
    assert_redirected_to testimonial_path(assigns(:testimonial))
  end

  def test_should_destroy_testimonial
    assert_difference('Testimonial.count', -1) do
      delete :destroy, :id => testimonials(:one).id
    end

    assert_redirected_to testimonials_path
  end
end
