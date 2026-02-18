class CravatesController < ApplicationController
  def index
    @cravates = Cravate.all
  end

  def show
    @cravate = Cravate.find(params[:id])
    @other_cravates = Cravate.where.not(id: @cravate.id).order("RANDOM()").limit(2)
  end
end
