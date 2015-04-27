require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  setup do
    @admin = users(:one)
    @user  = users(:two) 
    @product = products(:one)

    # set the user_field to :login_name 
    UserStamp.configure do |config|
      config.user_field = :login_name
    end        
  end
  
  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    sign_in @admin
    get :new
    assert_response :success
  end

  test "should create product" do
    sign_in @admin
    assert_difference('Product.count') do
      post :create, product: { name: @product.name }
    end
    product = assigns(:product)
    assert_equal product.created_user, @admin.login_name
    assert_equal product.updated_user, @admin.login_name
    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    sign_in @admin
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    sign_in @user
    patch :update, id: @product, product: { name: @product.name }
    
    product = assigns(:product)
    assert_equal product.created_user, @admin.login_name
    assert_equal product.updated_user, @user.login_name
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    sign_in @admin
    assert_difference('Product.not_deleted.count', -1) do
      delete :destroy, id: @product
    end    
    product = assigns(:product)
    assert_equal product.destroy_user, @admin.login_name
    assert_redirected_to products_path
  end
end
