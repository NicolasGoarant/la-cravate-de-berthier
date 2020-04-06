class CravatesController < ApplicationController
  skip_before_action :authenticate_user!

def index
  @cravates = Cravate.all
end

def show
  @cravate = Cravate.find(params[:id])
end

end
