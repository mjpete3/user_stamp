#     This file is part of the UserStamp library that provides tools to
#     track who created, updated, or destroyed a record in the database.
#
#     https://github.com/mjpete3/user_stamp
#     
#     Copyright (C) 2015 PD Technology Solutions, LLC
#
#     Permission is hereby granted, free of charge, to any person obtaining
#     a copy of this software and associated documentation files (the
#     "Software"), to deal in the Software without restriction, including
#     without limitation the rights to use, copy, modify, merge, publish,
#     distribute, sublicense, and/or sell copies of the Software, and to
#     permit persons to whom the Software is furnished to do so, subject to
#     the following conditions:
#
#     The above copyright notice and this permission notice shall be
#     included in all copies or substantial portions of the Software.
#
#     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

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
      post :create, material: {  name: @material.name }
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
    put :update, id: @material, material: { name: @material.name }

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
