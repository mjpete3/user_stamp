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

class MaterialsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = Material.all
    
    respond_to do |format|
      format.html
    end    
  end

  def show
    respond_to do |format|
      format.html
    end    
  end

  def new
    @material = Material.new
    respond_to do |format|
      format.html
    end    
  end

  def edit
  end

  def create
    @material = Material.new(params[:material])
    @material.save

    respond_to do |format|
      format.html { redirect_to material_path(@material) }
    end    
  end

  def update
    @material.update_attributes(params[:material])
    respond_to do |format|
      format.html { redirect_to material_path(@material) }
    end    
  end

  def destroy
    @material.destroy

    respond_to do |format|
      format.html { redirect_to materials_path }
    end    
  end

  private
    def set_material
      @material = Material.find(params[:id])
    end
end
