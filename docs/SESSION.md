# Session de travail — NexusTech / ElixirTech

**Date :** 21/06/2026  
**Repo :** https://github.com/ucfzem/elixir  
**Tunnel :** https://afraid-results-fry.loca.lt (localtunnel, peut expirer)

---

## Ce qui a été fait

### 1. Projet Phoenix (branche `main`)
- Application Phoenix 1.7 avec LiveView 1.0, SQLite
- Pages : `/` (produits), `/products/:id`, `/customers`
- Filtres par catégorie + tri (prix, récent)
- Base seedée : 12 produits, 10 clients

### 2. Problèmes corrigés
- `Phoenix.View` retiré des LiveViews (incompatible)
- `Plug.Session` ajouté avec `secret_key_base` 64 bytes
- `Plug.Static` ajouté pour servir les images
- Template layout renommé `layout/` → `layouts/`
- Syntaxe HEEx corrigée : `selected={@bool}` au lieu de `{if ..., do: "selected"}`
- `csrf-token` corrigé : `content={expr}` au lieu de `content="<%= expr %>"`
- `DateTime.to_date` → `NaiveDateTime.to_date` (car SQLite stocke NaiveDateTime)
- `product.stop` → `product.stock` (typo)

### 3. Logo
- Fichier zip → extrait → `priv/static/images/logo.png`
- Fond noir rendu transparent (via Python PIL)
- Texte "NexusTech" retiré, logo seul agrandi (3.5rem)
- Copié aussi dans `docs/images/` pour le site statique

### 4. Infrastructure
- Caddy installé (reverse proxy, compression gzip)
- Ports : Phoenix sur `4001`, Caddy sur `8080`
- **Problème :** le serveur est derrière un NAT (`41.251.203.243`), ports non accessibles depuis l'extérieur
- Solution temporaire : tunnel localtunnel (`https://afraid-results-fry.loca.lt`)
- Solution souhaitée (reportée) : Cloudflare Tunnel (cloudflared) — téléchargement impossible depuis ce serveur

### 5. GitHub
- `_build/` et `deps/` retirés du suivi git (`.`gitignore`)
- Dernier commit : `b127185` — "NexusTech: app Phoenix LiveView complete"

---

## Pour reprendre plus tard

```bash
git clone https://github.com/ucfzem/elixir.git
cd elixir
mix deps.get
mix ecto.create && mix ecto.migrate && mix run priv/repo/seeds.exs
mix phx.server
```

### Si besoin de tunnel
```bash
npx localtunnel --port 4001
# ou si cloudflared dispo :
cloudflared tunnel --url http://localhost:4001
```

---

## Structure du projet
```
elixir_techstore/
├── config/              # Configuration Phoenix
├── lib/techstore/
│   ├── accounts/        # Customer schema + contexte
│   ├── catalog/         # Product schema + contexte
│   └── web/
│       ├── live/        # LiveViews (produits, clients)
│       ├── templates/   # Layout
│       └── endpoint.ex
├── priv/
│   ├── repo/migrations/ # DB migrations
│   └── static/images/   # Logo
├── docs/                # Site statique (gh-pages)
└── Caddyfile            # Reverse proxy
```
