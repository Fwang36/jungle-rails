class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASS']
  
  def index
  end

end