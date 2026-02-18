class PagesController < ApplicationController
  def home
    # Configuration
    @page_title = "La Cravate de Berthier | L'Élégance de la Déconstruction"

    # Charger les cravates depuis la BDD
    @cravates = Cravate.all

    # Images de Berthier avec les différentes cravates (pour le sélecteur hero)
# Images de Berthier avec les différentes cravates (pour le sélecteur hero)
    @hero_cravates = [
      {
        name: "La Réunion de 17h30",
        image: "Berthier_rose_bleue.png",
        swatch_color: "#1e3a5f"  # Bleu pétrole
      },
      {
        name: "Le Café Soluble",
        image: "Berthier_rouge.png",
        swatch_color: "#b33a3a"  # Rouge
      },
      {
        name: "La Pause Déjeuner",
        image: "Berthier_vert.png",
        swatch_color: "#4a6741"  # Vert de gris
      }
    ]

    # Hero section
    @hero = {
      title: "L'ÉLÉGANCE DE LA<br>DÉCONSTRUCTION.",
      subtitle: "La cravate qui n'a plus rien à prouver.",
      cta_text: "Ouvrir le dossier",
      cta_link: cravates_path,
      image: "Berthier2.jpg",
      image_alt: "Berthier au bureau"
    }

    # Piliers (valeurs)
    @pillars = [
      {
        ref: "[DOSSIER ECO-2026]",
        title: "ÉCOLOGIQUE",
        description: "100% Lin bio sourcé en France. Une matière qui respire, contrairement à votre carrière."
      },
      {
        ref: "[DOSSIER FEM-1994]",
        title: "FÉMINISTE",
        description: "10% des bénéfices reversés. Parce que le patriarcat de bureau est un concept dépassé, même pour Berthier."
      },
      {
        ref: "[DOSSIER ESS-FR]",
        title: "SOLIDAIRE",
        description: "Confectionnée par des entreprises de l'ESS. On soutient l'humain, le vrai, celui des ateliers."
      }
    ]

    # Bio Berthier
    @bio = {
      title: "LE MANIFESTE DE L'ANTI-HÉROS",
      quote: "J'ai passé 22 ans à serrer des nœuds de cravate pour des gens qui ne connaissaient pas mon nom. Aujourd'hui, je desserre le mien.",
      content: "Berthier n'est pas un leader. Il n'est pas « disruptif ». Il est celui qui reste quand les néons grésillent. Il fabrique des cravates pour les hommes qui préfèrent la lucidité à l'ambition mal placée.",
      signature: "— Berthier, Service Comptabilité, 1994-2016"
    }

    # Newsletter
    @newsletter = {
      title: "REJOINDRE LE SERVICE COMPTABILITÉ",
      description: "Recevez nos notes de service internes. Garantie sans spam, uniquement de la résignation élégante.",
      placeholder: "berthier.m@entreprise.fr",
      button: "Valider le formulaire"
    }

    # Footer
    @footer = {
      year: Time.current.year,
      company: "LA CRAVATE DE BERTHIER",
      legal: "S.A.R.L. AU CAPITAL DE 120 FRANCS",
      links: [
        { text: "CGV", url: "#" },
        { text: "Mentions légales", url: "#" },
        { text: "Contact", url: "#" }
      ]
    }
  end

  def subscribe_newsletter
    email = params[:email]

    if email.present? && valid_email?(email)
      # TODO: Sauvegarder en base de données
      # NewsletterSubscriber.create(email: email)

      flash[:notice] = "Bienvenue au service comptabilité. Votre badge d'accès vous sera envoyé sous 3 à 5 jours ouvrés."
      Rails.logger.info "[Newsletter] Nouvelle inscription: #{email}"
    else
      flash[:alert] = "Format d'email non conforme aux normes administratives ISO-9001."
    end

    redirect_to root_path
  end

  private

  def valid_email?(email)
    email.match?(URI::MailTo::EMAIL_REGEXP)
  end
end
