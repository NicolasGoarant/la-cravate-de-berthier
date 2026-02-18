# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Nettoyage des anciennes cravates..."
Cravate.destroy_all

puts "Création des cravates de Berthier..."

cravates = [
  {
    name: "La Réunion de 17h30",
    reference: "#17H30",
    color: "Bleu pétrole",
    price: 75.00,
    description: "Un bleu pétrole digne des moquettes de La Défense. Pour porter le poids du monde avec une légèreté froissée. Cette cravate a vu plus de PowerPoints que vous n'en verrez jamais.",
    material: "100% Lin bio français",
    stock: 15
  },
  {
    name: "Le Café Soluble",
    reference: "#RICORÉ",
    color: "Beige administratif",
    price: 75.00,
    description: "Beige administratif. La couleur de ceux qui ont compris que l'ambition n'est qu'un concept marketing. Se marie parfaitement avec une chemise à manches courtes.",
    material: "100% Lin bio français",
    stock: 12
  },
  {
    name: "La Pause Déjeuner",
    reference: "#12H17",
    color: "Vert de gris",
    price: 75.00,
    description: "Vert de gris, comme les néons qui clignotent. Pour les résignés élégants qui savent que la vraie liberté commence à 12h et se termine à 14h.",
    material: "100% Lin bio français",
    stock: 0
  }
]

cravates.each do |cravate_attrs|
  cravate = Cravate.create!(cravate_attrs)
  puts "  ✓ #{cravate.name} créée (stock: #{cravate.stock})"
end

puts ""
puts "#{Cravate.count} cravates créées avec succès !"
puts "Berthier approuve. 👔"
