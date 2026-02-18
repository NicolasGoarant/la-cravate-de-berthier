# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Nettoyage des anciennes cravates..."
Cravate.destroy_all

puts "Création des cravates de Berthier..."

cravates = [
  # === LES 3 ORIGINALES ===
  {
    name: "La Réunion de 17h30",
    reference: "#17H30",
    color: "Rayures roses et bleues",
    price: 75.00,
    description: "Un bleu pétrole digne des moquettes de La Défense. Pour porter le poids du monde avec une légèreté froissée.",
    material: "100% Lin bio français",
    stock: 15,
    image_file: "roses_et_bleues.png",
    story: "Née un mardi de novembre, entre la slide 47 et la slide 48 d'un PowerPoint sur la \"synergie transversale\". Berthier l'a esquissée sur un Post-it, pendant que son manager parlait d'agilité. Les rayures représentent les 22 années de service. Le rose, c'est pour l'espoir. Le bleu, pour tout le reste.",
    when_to_wear: "Lors d'une réunion dont vous connaissez déjà l'issue. Un vendredi après-midi quand plus rien n'a d'importance. Pour dire \"je suis là\" sans vraiment être là.",
    berthier_quote: "Cette cravate m'a accompagné dans 847 réunions. Elle n'a jamais pris la parole. Moi non plus."
  },
  {
    name: "Le Café Soluble",
    reference: "#RICORÉ",
    color: "Rouge vif",
    price: 75.00,
    description: "Rouge comme le voyant de la cafetière qui n'a jamais été détartré. La couleur de ceux qui ont compris que l'ambition n'est qu'un concept marketing.",
    material: "100% Lin bio français",
    stock: 12,
    image_file: "rouge.png",
    story: "Inspirée par la couleur exacte du voyant de la cafetière du 3ème étage — celle qui n'a jamais été détartrée depuis 1997. Berthier la portait les jours où il avait besoin de se sentir vivant. C'est-à-dire tous les jours.",
    when_to_wear: "À 8h47, devant la machine à café. Lors d'un entretien annuel où l'on vous explique que le budget augmentations est \"gelé\". Pour mettre de la couleur dans un open space beige.",
    berthier_quote: "Le rouge, c'est pour ceux qui ont encore quelque chose à prouver. Moi, j'ai arrêté en 2003. Mais je la porte quand même."
  },
  {
    name: "La Pause Déjeuner",
    reference: "#12H17",
    color: "Vert sapin",
    price: 75.00,
    description: "Vert de gris, comme les néons qui clignotent. Pour les résignés élégants qui savent que la vraie liberté commence à 12h et se termine à 14h.",
    material: "100% Lin bio français",
    stock: 8,
    image_file: "vert.png",
    story: "Créée pendant une pause déjeuner de 2h17 — la plus longue de la carrière de Berthier. Il regardait par la fenêtre de la cantine un sapin municipal, et s'est dit : \"Lui au moins, il ne fait pas de reporting.\" Le vert est un hommage à cette liberté.",
    when_to_wear: "Entre 12h et 14h, quand vous êtes officiellement \"en réunion extérieure\". Pour un déjeuner qui s'éternise volontairement. Quand vous avez besoin de respirer.",
    berthier_quote: "La vraie liberté commence à 12h et se termine à 14h. Cette cravate, c'est ma fenêtre."
  },

  # === CRAVATES UNIES ===
  {
    name: "La Note de Frais",
    reference: "#NDF",
    color: "Gris ardoise",
    price: 75.00,
    description: "La couleur des justificatifs perdus et des remboursements qui n'arriveront jamais.",
    material: "100% Lin bio français",
    stock: 10,
    image_file: "gris_fonce.png",
    story: "Gris comme les justificatifs perdus au fond d'un tiroir. Gris comme l'espoir d'un remboursement qui n'arrivera jamais. Berthier a créé cette cravate après avoir attendu 247 jours le remboursement d'un sandwich SNCF.",
    when_to_wear: "Pour déposer une note de frais. En attendant une réponse de la comptabilité. Quand vous avez compris que l'argent de l'entreprise n'est pas vraiment le vôtre.",
    berthier_quote: "J'ai gardé tous mes tickets de métro depuis 1994. Un jour, quelqu'un les regardera. Un jour."
  },
  {
    name: "Le Pot de Départ",
    reference: "#ADIEU",
    color: "Bordeaux fané",
    price: 75.00,
    description: "Un rouge qui a vu trop de champagnes tièdes et de discours hypocrites. Pour les survivants des \"on reste en contact\".",
    material: "100% Lin bio français",
    stock: 6,
    image_file: "bordeaux.png",
    story: "Ce bordeaux a vu 34 pots de départ. 34 fois les mêmes mots : \"On reste en contact.\" 34 fois le champagne tiède et les petits fours Picard. Berthier l'a créée pour ceux qui partent et pour ceux qui restent.",
    when_to_wear: "Pour dire au revoir à quelqu'un que vous ne reverrez jamais. Pour trinquer avec un gobelet en plastique. Quand vous êtes le prochain sur la liste.",
    berthier_quote: "Les pots de départ, c'est comme les cravates : tout le monde fait semblant d'être content."
  },
  {
    name: "L'Open Space",
    reference: "#FLEX",
    color: "Beige moquette",
    price: 75.00,
    description: "La teinte exacte des cloisons amovibles et des rêves abandonnés. Se fond parfaitement dans n'importe quel environnement de travail toxique.",
    material: "100% Lin bio français",
    stock: 11,
    image_file: "beige_moquette.png",
    story: "Teinte exacte des cloisons amovibles et des rêves abandonnés. Berthier l'a conçue pour se fondre dans le décor. Pour disparaître. Pour que personne ne lui demande \"t'as deux minutes ?\".",
    when_to_wear: "Quand vous voulez qu'on vous oublie. En flex office, pour ne pas qu'on vous retrouve. Les jours où vous n'avez rien à dire.",
    berthier_quote: "Le beige, c'est la couleur de l'invisibilité. En 22 ans, personne ne m'a jamais dit que j'étais bien habillé. Mission accomplie."
  },
  {
    name: "Le Lundi Matin",
    reference: "#0847",
    color: "Bleu marine",
    price: 75.00,
    description: "Sombre comme votre motivation à 8h47 devant la machine à café. S'accorde avec les cernes et les soupirs.",
    material: "100% Lin bio français",
    stock: 14,
    image_file: "bleu_marine.png",
    story: "8h47. Le RER est en retard. Le café est froid. La semaine n'a pas encore commencé qu'elle est déjà trop longue. Ce bleu nuit capture ce moment précis où l'on se dit : \"Plus que 5 jours.\"",
    when_to_wear: "Le lundi matin. Tous les lundis matin. Et les mardis qui ressemblent à des lundis.",
    berthier_quote: "Le bleu marine, c'est sérieux sans être triste. C'est triste sans être grave. C'est parfait pour le lundi."
  },
  {
    name: "La Promotion Refusée",
    reference: "#N+1",
    color: "Vert olive terne",
    price: 75.00,
    description: "Pour ceux qui ont \"beaucoup de potentiel\" depuis 2007. Une couleur qui dit \"j'ai compris\" sans faire de vagues.",
    material: "100% Lin bio français",
    stock: 9,
    image_file: "vert_olive.png",
    story: "\"Beaucoup de potentiel.\" Berthier a entendu cette phrase 17 fois en 22 ans. 17 fois, on lui a dit qu'il était \"sur la bonne voie\". Ce vert olive, c'est la couleur de la patience. Ou de la résignation. C'est parfois la même chose.",
    when_to_wear: "Après un entretien annuel décevant. Quand votre N+1 devient votre N. Pour sourire sans faire de vagues.",
    berthier_quote: "On m'a dit que j'avais du potentiel en 1996. Je l'ai toujours. Il est intact."
  },
  {
    name: "Le Mail Non Lu",
    reference: "#847MSG",
    color: "Blanc cassé",
    price: 75.00,
    description: "847 messages en attente. Cette cravate ne juge pas votre boîte de réception, elle la comprend.",
    material: "100% Lin bio français",
    stock: 9,
    image_file: "blanc_casse.png",
    story: "847 messages non lus. Berthier a arrêté de compter en 2011. Cette cravate blanc cassé, c'est la couleur de l'inbox zero qu'il n'atteindra jamais. Et c'est très bien comme ça.",
    when_to_wear: "Quand votre boîte mail déborde. Pour une réunion sur \"l'amélioration de la communication interne\". Les jours où vous avez décidé de ne plus répondre.",
    berthier_quote: "Un mail non lu, c'est un problème qui peut attendre. 847 mails non lus, c'est une philosophie de vie."
  },
  {
    name: "L'Afterwork Obligatoire",
    reference: "#18H30",
    color: "Orange bureaucratique",
    price: 75.00,
    description: "La couleur des cocktails sans alcool et des conversations forcées avec le stagiaire. Pour ceux qui sourient en pensant à leur canapé.",
    material: "100% Lin bio français",
    stock: 7,
    image_file: "orange_bureaucratique.png",
    story: "18h30. \"Tu viens au pot ?\" La question qui n'en est pas une. Cet orange, c'est la couleur des cocktails sans alcool et des conversations sur la météo avec le stagiaire. Berthier l'a créée pour survivre à ces moments.",
    when_to_wear: "Pour un afterwork que vous n'avez pas choisi. Un team building au bowling. Une \"soirée cohésion\" un jeudi soir.",
    berthier_quote: "L'afterwork, c'est du travail supplémentaire non rémunéré. Mais avec des cacahuètes."
  },

  # === CRAVATES À MOTIFS ===
  {
    name: "Le Tableau Excel",
    reference: "#XLSM",
    color: "Rayures grises et blanches",
    price: 79.00,
    description: "Chaque ligne raconte une histoire de cellules fusionnées et de formules cassées.",
    material: "100% Lin bio français",
    stock: 5,
    image_file: "grises_et_blanches.png",
    story: "Chaque rayure est une ligne. Chaque ligne est une donnée. Berthier a passé 8 147 heures sur Excel. Il a créé cette cravate le jour où il a découvert les tableaux croisés dynamiques. Ce jour-là, tout a changé. Et rien n'a changé.",
    when_to_wear: "Pour une présentation de chiffres. Quand vous avez cassé une formule et que personne ne le sait encore. En hommage à la cellule A1.",
    berthier_quote: "Ma vie tient dans un tableur. Colonnes A à Z, lignes 1 à 10 000. Le reste, c'est du hors-sujet."
  },
  {
    name: "La Réunion Sans Fin",
    reference: "#∞H00",
    color: "Carreaux gris et bleus",
    price: 79.00,
    description: "Un motif qui tourne en boucle, comme l'ordre du jour qui n'avance jamais.",
    material: "100% Lin bio français",
    stock: 4,
    image_file: "gris_et_bleues.png",
    story: "Cette réunion devait durer 30 minutes. Elle a duré 3 heures. Les carreaux représentent le temps qui passe. Ou qui ne passe pas. Berthier l'a dessinée pendant qu'on débattait de la couleur du logo.",
    when_to_wear: "Pour une réunion qui aurait pu être un mail. Quand l'ordre du jour dépasse 12 points. Les jours où votre agenda est un Tetris.",
    berthier_quote: "J'ai passé 4 380 heures en réunion. J'aurais pu apprendre le japonais. J'ai appris à dormir les yeux ouverts."
  },
  {
    name: "Le PowerPoint Urgent",
    reference: "#PPTX",
    color: "Rayures rouges et blanches",
    price: 79.00,
    description: "Des rayures qui crient \"deadline\" sans jamais vraiment avancer.",
    material: "100% Lin bio français",
    stock: 6,
    image_file: "rouges_blanches.png",
    story: "\"C'est pour dans une heure.\" Les rayures rouges, c'est l'urgence. Les blanches, c'est le vide de la slide 7. Berthier a créé cette cravate pendant une nuit blanche à aligner des bullet points.",
    when_to_wear: "Quand tout est urgent mais rien n'est important. Pour une présentation que personne ne lira. En tapant \"Lorem ipsum\" à 23h47.",
    berthier_quote: "Un bon PowerPoint, c'est 80% de police Arial et 20% de désespoir. Le reste, c'est des animations."
  },
  {
    name: "La Machine à Café",
    reference: "#EXPRESSO",
    color: "Pois crème et marron",
    price: 79.00,
    description: "Petites taches de café lyophilisé sur fond de conversations évitées.",
    material: "100% Lin bio français",
    stock: 8,
    image_file: "creme_pois.png",
    story: "Les pois, ce sont les gouttes de café sur la chemise de Berthier. Le crème, c'est le lait en poudre. Cette cravate célèbre le seul endroit du bureau où l'on dit la vérité : devant la machine à café.",
    when_to_wear: "Pour vos 4 pauses café quotidiennes. Quand vous évitez quelqu'un en faisant semblant de chercher du sucre. Les jours où le distributeur est en panne.",
    berthier_quote: "À la machine à café, j'ai appris plus de choses qu'en 22 ans de réunions. Notamment que Martine divorce."
  },
  {
    name: "Le Badge Oublié",
    reference: "#ACCÈS",
    color: "Rayures jaunes et noires",
    price: 79.00,
    description: "Le motif universel de \"je dois redemander l'accès au parking\".",
    material: "100% Lin bio français",
    stock: 3,
    image_file: "jaunes_et_noires.png",
    story: "Jaune et noir comme la signalétique de sécurité. Comme le badge que Berthier oublie une fois par semaine. Cette cravate est un hommage à tous ceux qui attendent à l'accueil en disant \"je travaille ici, je vous jure\".",
    when_to_wear: "Quand vous avez oublié votre badge. Pour expliquer au vigile que oui, vous êtes bien du service compta. Les jours où le portique refuse de s'ouvrir.",
    berthier_quote: "En 22 ans, j'ai oublié mon badge 1 147 fois. La sécurité me connaît mieux que ma propre mère."
  },
  {
    name: "Le Séminaire Team Building",
    reference: "#COHÉSION",
    color: "Carreaux jaunes et verts",
    price: 79.00,
    description: "Un classique revisité pour les survivants des chutes de confiance et des ateliers post-it.",
    material: "100% Lin bio français",
    stock: 5,
    image_file: "carres_jaunes_verts.png",
    story: "Jaune pour les post-its. Vert pour les arbres du centre de séminaire en Sologne. Cette cravate a survécu à 12 chutes de confiance, 8 ateliers brainstorming et 1 course d'orientation humiliante.",
    when_to_wear: "Pour un séminaire d'entreprise. Quand on vous demande de \"sortir de votre zone de confort\". En faisant semblant d'aimer le karaoké.",
    berthier_quote: "Le team building, c'est payer pour faire des choses qu'on ne ferait jamais gratuitement. Avec des gens qu'on voit déjà 40 heures par semaine."
  },
  {
    name: "L'Augmentation Reportée",
    reference: "#N+1AN",
    color: "Chevrons gris et taupe",
    price: 79.00,
    description: "Un motif qui monte, puis redescend, puis remonte — comme les promesses de votre N+1.",
    material: "100% Lin bio français",
    stock: 7,
    image_file: "chevrons_gris.png",
    story: "Les chevrons montent, puis redescendent. Comme les promesses de votre manager. \"L'année prochaine.\" Berthier a entendu cette phrase 22 fois. Il a créé cette cravate pour ceux qui savent que \"l'année prochaine\" est un concept abstrait.",
    when_to_wear: "Après un entretien où l'on vous a dit \"le budget est serré\". Pour négocier quelque chose que vous n'obtiendrez pas. En regardant le salaire du nouveau.",
    berthier_quote: "On m'a promis une augmentation en 1998. Je l'attends toujours. La cravate, elle, est déjà là."
  }
]

cravates.each do |cravate_attrs|
  image_file = cravate_attrs.delete(:image_file)
  cravate = Cravate.create!(cravate_attrs)

  # Attacher l'image si le fichier existe
  image_path = Rails.root.join("app/assets/images/#{image_file}")
  if File.exist?(image_path)
    cravate.photos.attach(
      io: File.open(image_path),
      filename: image_file,
      content_type: "image/png"
    )
    puts "  ✓ #{cravate.name} créée avec photo"
  else
    puts "  ⚠ #{cravate.name} créée SANS photo - fichier non trouvé: #{image_file}"
  end
end

puts ""
puts "════════════════════════════════════════"
puts "#{Cravate.count} cravates créées avec succès !"
puts "Berthier approuve. 👔"
puts "════════════════════════════════════════"
