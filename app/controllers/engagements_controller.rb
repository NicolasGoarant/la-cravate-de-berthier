class EngagementsController < ApplicationController
  def ecologique
    @page_title = "Écologique | La Cravate de Berthier"
  end

  def feministe
    @page_title = "Féministe | La Cravate de Berthier"
  end

  def solidaire
    @page_title = "Solidaire | La Cravate de Berthier"
  end
end
