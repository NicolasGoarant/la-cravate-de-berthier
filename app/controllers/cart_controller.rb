# app/controllers/cart_controller.rb

class CartController < ApplicationController
  before_action :initialize_cart

  # GET /panier
  def show
    @cart_items = load_cart_items
    @cart_total = calculate_total
    @shipping_cost = calculate_shipping
  end

  # POST /panier/ajouter/:id
  def add
    cravate = Cravate.find(params[:id])
    
    # Vérifier disponibilité
    unless cravate.available?
      redirect_to cravate_path(cravate), alert: "Cette cravate n'est plus disponible."
      return
    end

    # Ajouter au panier (ou incrémenter si déjà présente)
    cart = session[:cart] ||= {}
    cravate_id = cravate.id.to_s
    
    if cart[cravate_id]
      cart[cravate_id] += 1
    else
      cart[cravate_id] = 1
    end

    redirect_to cart_path, notice: "« #{cravate.name} » ajoutée au panier."
  end

  # PATCH /panier/modifier/:id
  def update
    cravate_id = params[:id].to_s
    quantity = params[:quantity].to_i

    if quantity <= 0
      session[:cart].delete(cravate_id)
    else
      session[:cart][cravate_id] = [quantity, 5].min # Max 5 par cravate
    end

    redirect_to cart_path
  end

  # DELETE /panier/supprimer/:id
  def remove
    session[:cart].delete(params[:id].to_s)
    redirect_to cart_path, notice: "Article retiré du panier."
  end

  # DELETE /panier/vider
  def clear
    session[:cart] = {}
    redirect_to cart_path, notice: "Panier vidé."
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end

  def load_cart_items
    return [] if session[:cart].blank?

    session[:cart].map do |cravate_id, quantity|
      cravate = Cravate.find_by(id: cravate_id)
      next unless cravate

      {
        cravate: cravate,
        quantity: quantity,
        subtotal: cravate.price * quantity
      }
    end.compact
  end

  def calculate_total
    load_cart_items.sum { |item| item[:subtotal] }
  end

  def calculate_shipping
    # Gratuit dès 2 cravates
    total_items = session[:cart].values.sum
    total_items >= 2 ? 0 : 4.90
  end
end
