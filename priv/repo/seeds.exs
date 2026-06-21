alias Techstore.Repo
alias Techstore.Catalog.Product
alias Techstore.Accounts.Customer

# ── Products ────────────────────────────────────────────────────
products = [
  %{
    nom: "QuantumPhone X Pro",
    description: "Smartphone révolutionnaire avec écran pliable 8 pouces, processeur A18 Bionic, appareil photo 200MP et batterie 6000mAh. Charge ultra-rapide 200W.",
    prix: Decimal.new("1299.00"),
    image_url: "https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=800&q=80",
    stock: 45,
    categorie: "Smartphones"
  },
  %{
    nom: "NovaBook Ultra 16",
    description: "Ordinateur portable 16\" OLED 4K, Intel Core Ultra 9, 32Go RAM, 2To SSD, RTX 5090. Autonomie 18h. Idéal pour le gaming et la création.",
    prix: Decimal.new("2499.00"),
    image_url: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=800&q=80",
    stock: 12,
    categorie: "Ordinateurs"
  },
  %{
    nom: "AirPulse Pro Buds",
    description: "Écouteurs sans fil avec réduction de bruit active adaptative, audio spatial 3D, 48h d'autonomie, résistance IPX7 et charge sans-fil MagSafe.",
    prix: Decimal.new("249.00"),
    image_url: "https://images.unsplash.com/photo-1590658268037-6bf12f032f55?w=800&q=80",
    stock: 120,
    categorie: "Audio"
  },
  %{
    nom: "ChronoWatch Ultra",
    description: "Montre connectée sportive avec écran AMOLED toujours visible, GPS bi-fréquence, capteur santé avancé (ECG, SpO2, température), 14 jours d'autonomie.",
    prix: Decimal.new("599.00"),
    image_url: "https://images.unsplash.com/photo-1546868871-af0de0ae72de?w=800&q=80",
    stock: 67,
    categorie: "Smartphones"
  },
  %{
    nom: "Orion Desktop Station",
    description: "Station de travail tout-en-un 32\" 8K, AMD Ryzen Threadripper, 64Go DDR5, 4To NVMe, RTX A6000. Pour les professionnels du rendu 3D et de l'IA.",
    prix: Decimal.new("4999.00"),
    image_url: "https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=800&q=80",
    stock: 5,
    categorie: "Ordinateurs"
  },
  %{
    nom: "SoundWave Max Speaker",
    description: "Enceinte Bluetooth portable 360° avec son Dolby Atmos, basses profondes, 30h d'autonomie, étanche IP68. Parfaite pour l'extérieur.",
    prix: Decimal.new("179.00"),
    image_url: "https://images.unsplash.com/photo-1589003077984-894e133dabab?w=800&q=80",
    stock: 88,
    categorie: "Audio"
  },
  %{
    nom: "FoldScreen Z 2026",
    description: "Smartphone pliable nouvelle génération. Écran principal 7.6\" LTPO 120Hz, écran externe 6.2\". Snapdragon 8 Gen 4, 16Go RAM, caméra sous-écran.",
    prix: Decimal.new("1599.00"),
    image_url: "https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=800&q=80",
    stock: 23,
    categorie: "Smartphones"
  },
  %{
    nom: "SlimBook Air 14",
    description: "Ultrabook 14\" 2.8K OLED, poids 980g, Intel Core Ultra 7, 16Go RAM, 512Go SSD. Autonomie 20h. Design unibody en titane recyclé.",
    prix: Decimal.new("1499.00"),
    image_url: "https://images.unsplash.com/photo-1531297484001-80022131f5a1?w=800&q=80",
    stock: 34,
    categorie: "Ordinateurs"
  },
  %{
    nom: "BassDrop Wireless",
    description: "Casque audio circum-aural avec ANC hybride, drivers 50mm en graphène, audio LDAC, 60h d'autonomie, pliable et léger (250g).",
    prix: Decimal.new("349.00"),
    image_url: "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=800&q=80",
    stock: 55,
    categorie: "Audio"
  },
  %{
    nom: "PixelTab Pro 12.9",
    description: "Tablette professionnelle 12.9\" Mini-LED 120Hz, M4 chip, 16Go RAM, 1To SSD, stylet inclus avec retour haptique. Magic Keyboard compatible.",
    prix: Decimal.new("1099.00"),
    image_url: "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&q=80",
    stock: 41,
    categorie: "Ordinateurs"
  },
  {
    nom: "GameSphere X",
    description: "Console de salon 8K avec ray-tracing temps réel, SSD 2To, manette adaptative haptique. Rétrocompatibilité 4 générations. Sortie en 2026.",
    prix: Decimal.new("699.00"),
    image_url: "https://images.unsplash.com/photo-1486401899868-0e435ed85128?w=800&q=80",
    stock: 0,
    categorie: "Smartphones"
  },
  {
    nom: "VocalLink Transceiver",
    description: "Micro-cravate pro sans-fil avec réduction de bruit IA, portée 200m, batterie 20h, compatible tout appareil. Pour streamers et professionnels.",
    prix: Decimal.new("129.00"),
    image_url: "https://images.unsplash.com/photo-1590602847861-f357a9332bbc?w=800&q=80",
    stock: 93,
    categorie: "Audio"
  }
]

IO.puts("🌱 Seeding products...")
Enum.each(products, fn attrs ->
  %Product{}
  |> Product.changeset(attrs)
  |> Repo.insert!(on_conflict: :nothing)
end)
IO.puts("  ✓ #{length(products)} produits insérés")

# ── Customers ───────────────────────────────────────────────────
customers = [
  %{nom: "Alice Moreau", email: "alice.moreau@email.com", adresse: "42 Rue de la Tech, 75001 Paris"},
  %{nom: "Bob Ibrahim", email: "bob.ibrahim@email.com", adresse: "15 Avenue du Code, 69002 Lyon"},
  %{nom: "Clara Dubois", email: "clara.dubois@email.com", adresse: "8 Impasse du Phoenix, 31000 Toulouse"},
  %{nom: "David Chen", email: "david.chen@email.com", adresse: "27 Boulevard Digital, 13001 Marseille"},
  %{nom: "Emma Laurent", email: "emma.laurent@email.com", adresse: "3 Place de l'Innovation, 44000 Nantes"},
  %{nom: "Farid Benali", email: "farid.benali@email.com", adresse: "19 Rue du Serveur, 33000 Bordeaux"},
  %{nom: "Gabrielle Silva", email: "gabrielle.silva@email.com", adresse: "5 Allée des Algorithmes, 59000 Lille"},
  %{nom: "Hugo Martinez", email: "hugo.martinez@email.com", adresse: "12 Chemin du Logiciel, 67000 Strasbourg"},
  %{nom: "Isabelle Fontaine", email: "isabelle.fontaine@email.com", adresse: "7 Route du Cloud, 35000 Rennes"},
  %{nom: "Jules Petit", email: "jules.petit@email.com", adresse: "21 Square de la Data, 06000 Nice"},
]

IO.puts("🌱 Seeding customers...")
Enum.each(customers, fn attrs ->
  %Customer{}
  |> Customer.changeset(attrs)
  |> Repo.insert!(on_conflict: :nothing)
end)
IO.puts("  ✓ #{length(customers)} clients insérés")
IO.puts("✅ Seed terminé !")
