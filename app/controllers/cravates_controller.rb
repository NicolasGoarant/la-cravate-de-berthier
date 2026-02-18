class CravatesController < ApplicationController
  def index
    @cravates = Cravate.all
  end

  def show
    @cravate = Cravate.find(params[:id])
  end
end
