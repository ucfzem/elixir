# Email Pro — Cloudflare Workers

Autoresponder + envoi d'emails 100% gratuit sur ton propre domaine.

## Prérequis

- Un compte Cloudflare (gratuit)
- Un nom de domaine pointant vers Cloudflare (achat ~8-12€/an chez Cloudflare Registrar)
- Node.js installé sur ton téléphone (Termux)

## Installation

```bash
# Cloner le projet
git clone https://github.com/ucfzem/elixir.git
cd elixir/cloudflare-email

# Installer les dépendances
npm install

# Connecter wrangler à ton compte Cloudflare
npx wrangler login
```

## Configuration

### 1. Domaine chez Cloudflare

1. Va sur **cloudflare.com/registrar**
2. Achète ton domaine (ex: `tonnom.com`)
3. Cloudflare configure automatiquement les DNS

### 2. Variables d'environnement

Dans le dashboard Cloudflare → Workers & Pages → `email-pro` → Variables :

| Variable | Valeur | Exemple |
|----------|--------|---------|
| `FORWARD_TO` | Ton adresse Gmail | `moi@gmail.com` |
| `FROM_NAME` | Ton nom | `Uzem` |
| `FROM_EMAIL` | Ton adresse pro | `contact@tonnom.com` |

### 3. Email Routing

1. Dashboard Cloudflare → Email → Email Routing
2. Active Email Routing
3. Crée une règle : "Send to a Worker" → sélectionne `email-pro`
4. Pattern : `contact@tonnom.com` (ou `*` pour catch-all)

### 4. Email Sending (pour l'envoi)

1. Dashboard Cloudflare → Email → Email Routing → Email Sending
2. Active la beta
3. Configure le `send_email` binding dans wrangler.toml (déjà présent)

## Déploiement

```bash
npx wrangler deploy
```

## Utilisation

### Autoresponder automatique
Quand quelqu'un envoie un email à `contact@tonnom.com` :
1. L'email est forwardé vers ton Gmail
2. Une réponse automatique est envoyée à l'expéditeur

### Envoi d'email depuis ton Worker
```bash
curl -X POST https://email-pro.nomduworker.workers.dev/send \
  -H "Content-Type: application/json" \
  -d '{"to":"destinataire@email.com","subject":"Bonjour","text":"Message texte"}'
```

## Structure
```
cloudflare-email/
├── src/
│   └── index.js          # Worker principal
├── wrangler.toml         # Configuration Cloudflare
├── package.json          # Dépendances
└── README.md             # Ce fichier
```

## Limites du plan gratuit

| Service | Limite |
|---------|--------|
| Email Routing | forwarding illimité |
| Workers | 100 000 requêtes/jour |
| Email Sending | 2 000 emails/jour (beta) |
| Domaine | ~8-12€/an (seul vrai coût) |
