class CategoriesController < ApplicationController
  def index
    @category = Camera.where(category: params[:format])
  end

  #def show
    #@camera = Camera.find(params[:category])
  #end
end
