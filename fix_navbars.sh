#!/bin/bash

# Script pour remplacer les navbars en dur par le partial

cd ~/Documents/la-cravate-de-berthier

# Liste des fichiers à modifier
FILES=(
  "app/views/pages/home.html.erb"
  "app/views/pages/faq.html.erb"
  "app/views/pages/contact.html.erb"
  "app/views/pages/cgv.html.erb"
  "app/views/pages/mentions_legales.html.erb"
  "app/views/cart/show.html.erb"
  "app/views/cravates/index.html.erb"
  "app/views/cravates/show.html.erb"
  "app/views/engagements/ecologique.html.erb"
  "app/views/engagements/feministe.html.erb"
  "app/views/engagements/solidaire.html.erb"
)

for file in "${FILES[@]}"; do
  if [ -f "$file" ]; then
    # Remplacer le bloc header par le render partial
    # On utilise perl pour le multiline
    perl -i -0pe 's/<header class="main-header">.*?<\/header>/<%= render "shared\/navbar" %>/gs' "$file"
    echo "✅ $file"
  else
    echo "❌ $file (non trouvé)"
  fi
done

echo ""
echo "Terminé ! Vérifie avec: grep -l 'render.*navbar' app/views/**/*.erb"
