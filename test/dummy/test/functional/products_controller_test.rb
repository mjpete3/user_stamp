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

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
    
  setup do
    @admin = users(:one)
    @user  = users(:two)
    @product = products(:one)
    
    # set the user_field to :id 
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
      post :create, product: {  name: @product.name }
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
    put :update, id: @product, product: { name: @product.name }

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
