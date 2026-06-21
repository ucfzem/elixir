# NexusTech — High-Tech Store

Application e-commerce Elixir / Phoenix LiveView pour la vente de produits High-Tech.

## Stack

- **Elixir** ~> 1.16
- **Phoenix** ~> 1.7.14
- **Phoenix LiveView** ~> 1.0
- **Ecto** + **PostgreSQL**
- **Tailwind CSS** (dark mode, thème tech futuriste)
- **Unsplash** (images produit)

## Démarrer

```bash
# Installer les dépendances
mix deps.get

# Créer la base de données
mix ecto.create

# Lancer les migrations
mix ecto.migrate

# Insérer les données de démo
mix run priv/repo/seeds.exs

# Lancer le serveur
mix phx.server
```

Ouvrir [http://localhost:4000](http://localhost:4000).

## Structure du projet

```
lib/techstore/
├── accounts/          # Contexte Accounts (Customers)
│   ├── accounts.ex    # Fonctions de listing/création
│   └── customer.ex    # Schéma Ecto
├── catalog/           # Contexte Catalog (Products)
│   ├── catalog.ex     # Fonctions de listing/filtrage/tri
│   └── product.ex     # Schéma Ecto
├── web/
│   ├── components/    # Layouts et composants (.heex)
│   ├── controllers/   # ErrorHTML
│   ├── live/          # LiveViews et templates
│   │   ├── product_live/  # Index (grille) + Show (détail)
│   │   └── customer_live/ # Dashboard clients
│   ├── endpoint.ex
│   ├── router.ex
│   └── ...
├── application.ex
└── repo.ex
```

## Routes

| Route | Description |
|-------|-------------|
| `/` | Vitrine produits avec filtre et tri |
| `/products/:id` | Détail produit + Ajout panier |
| `/customers` | Dashboard clients |

## Captures d'écran

Le thème sombre futuriste utilise :
- Fond : `gray-950` (#0a0a0f) → `gray-800` (#1a1a25)
- Accents : cyan-400 → violet-500 (dégradé)
- Typo : Inter (sans) / JetBrains Mono (code)
- Bordures et glassmorphism subtils
