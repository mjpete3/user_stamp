require 'test_helper'

class MaterialsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  setup do
    @admin = users(:one)
    @user  = users(:two) 
    @material = materials(:one)

    # set the user_field to :id 
    UserStamp.configure do |config|
      config.user_field = :id
    end    
  end

  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:materials)
  end

  test "should get new" do
    sign_in @admin
    get :new
    assert_response :success
  end

  test "should create material" do
    sign_in @admin
    assert_difference('Material.count') do
      post :create, material: { name: @material.name }
    end
    material = assigns(:material)
    assert_equal material.created_user, @admin.id
    assert_equal material.updated_user, @admin.id
    assert_redirected_to material_path(assigns(:material))
  end

  test "should show material" do
    sign_in @admin
    get :show, id: @material
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get :edit, id: @material
    assert_response :success
  end

  test "should update material" do
    sign_in @user
    patch :update, id: @material, material: { name: @material.name  }
    material = assigns(:material)
    assert_equal material.created_user, @admin.id
    assert_equal material.updated_user, @user.id
    assert_redirected_to material_path(assigns(:material))
  end

  test "should destroy material" do
    sign_in @admin
    assert_difference('Material.not_deleted.count', -1) do
      delete :destroy, id: @material
    end
    material = assigns(:material)
    assert_equal material.destroy_user, @admin.id
    assert_redirected_to materials_path
  end
end
