# WellMum Landing - Version Légère

Une application Next.js légère basée sur les technologies de WellMum Landing avec une page d'accueil similaire.

## 🚀 Technologies utilisées

- **Next.js 15.5.4** - Framework React
- **React 19** - Bibliothèque UI
- **TypeScript 5** - Langage typé
- **Tailwind CSS 4** - Framework CSS utilitaire
- **Lucide React** - Icônes modernes

## 📦 Installation

### Prérequis

Installer Node.js et pnpm:

```bash
# Installer npm
sudo apt update && sudo apt install npm -y

# Installer pnpm globalement
sudo npm install -g pnpm
```

### Installation des dépendances

```bash
# Installer les dépendances du projet
pnpm install
```

## 🛠️ Développement

```bash
# Lancer le serveur de développement
pnpm dev
```

L'application sera disponible sur [http://localhost:3000](http://localhost:3000)

## 🏗️ Build Production

```bash
# Construire pour la production
pnpm build

# Démarrer le serveur de production
pnpm start
```

## 📁 Structure du projet

```
wellmum-landing/
├── app/
│   ├── layout.tsx       # Layout principal de l'application
│   ├── page.tsx         # Page d'accueil
│   └── globals.css      # Styles globaux Tailwind
├── components/
│   ├── Header.tsx       # En-tête avec navigation
│   └── HeroSection.tsx  # Section héro principale
├── lib/
│   └── utils.ts         # Fonctions utilitaires
├── public/              # Assets statiques
├── package.json         # Dépendances et scripts
├── tsconfig.json        # Configuration TypeScript
├── next.config.ts       # Configuration Next.js
└── postcss.config.mjs   # Configuration PostCSS
```

## ✨ Fonctionnalités

- ✅ Page d'accueil responsive avec design moderne
- ✅ Design similaire à WellMum (couleurs, typographie, layout)
- ✅ Header avec navigation et sélecteur de langue
- ✅ Section héro avec badges interactifs (24/7 Support, 12 Weeks Programme, 5 étoiles)
- ✅ Support multilingue (EN/FR) 
- ✅ Application légère et performante
- ✅ Mobile-first et responsive design

## 🎨 Personnalisation

Les couleurs principales sont définies dans [app/globals.css](app/globals.css):
- Primary (Vert): `#7aa89b`
- Accent (Rose): `#d77f82`
- Background: `#F8F8F8`

## 📝 Notes

Cette version est une version simplifiée et légère de WellMum Landing, créée avec les mêmes technologies (Next.js 15, React 19, Tailwind CSS 4) mais sans toutes les sections complexes de l'original pour garder l'application la plus légère possible.


The app serves the static files from `/public` and listens on port 3000.
