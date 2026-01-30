# WellMum AI Services

Microservices AI pour l'application WellMum, basés sur FastAPI avec Docker et nginx.

## 📦 Composants

### 1. **Chat** (Port 8002)
Service de chat IA pour interactions utilisateur.
- Endpoint health: `GET /healthz`

### 2. **Food Detector** (Port 8003)
Détection d'aliments via images avec estimation calorique.
- Endpoint health: `GET /healthz`

### 3. **Nutrition** (Port 8004)
Plans nutritionnels personnalisés basés sur l'IA.
- Endpoint health: `GET /healthz`

### 4. **Routines** (Port 8005)
Génération de routines d'exercices personnalisées.
- Endpoint health: `GET /healthz`

### 5. **Social** (Port 8006)
Gestion des interactions sociales avec modération IA.
- Endpoint health: `GET /healthz`

## 🚀 Technologies

- **Python 3.11** - Langage de programmation
- **FastAPI** - Framework web moderne et rapide
- **Uvicorn** - Serveur ASGI
- **Pydantic** - Validation de données
- **Nginx** - Reverse proxy
- **Docker & Docker Compose** - Conteneurisation

## 📁 Structure de chaque composant

```
<composant>/
├── Dockerfile              # Image Docker
├── compose.yaml           # Orchestration Docker
├── nginx.conf             # Configuration nginx
├── requirements.txt       # Dépendances Python
└── app/
    └── main.py           # Application FastAPI
```

## 🛠️ Utilisation

### Lancer un service individuellement

```bash
# Exemple avec chat
cd chat
docker-compose up --build

# Vérifier le health check
curl http://localhost:8002/healthz
```

### Lancer tous les services

```bash
# Depuis le dossier wellmum-ai
for service in chat food_detector nutrition routines social; do
  cd $service && docker-compose up -d --build && cd ..
done
```

### Arrêter tous les services

```bash
for service in chat food_detector nutrition routines social; do
  cd $service && docker-compose down && cd ..
done
```

## 📝 Endpoints disponibles

### Chat Service (8002)
```bash
# Health check
curl http://localhost:8002/healthz
```

### Food Detector (8003)
```bash
# Health check
curl http://localhost:8003/healthz
```

### Nutrition (8004)
```bash
# Health check
curl http://localhost:8004/healthz
```

### Routines (8005)
```bash
# Health check
curl http://localhost:8005/healthz
```

### Social (8006)
```bash
# Health check
curl http://localhost:8006/healthz
```

## 🔧 Configuration

Chaque service peut être configuré via variables d'environnement dans le `compose.yaml` :

- `PORT_PUBLISHED` : Port exposé sur l'hôte (défaut: 8002-8006)

## 📊 Architecture

```
┌─────────────┐
│   Client    │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Nginx     │  (Port 800X)
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  FastAPI    │  (Port 8000)
│     API     │
└─────────────┘
```

## ✅ Health Checks

Tous les services implémentent un endpoint `/healthz` qui retourne :
```json
{
  "status": "ok",
  "service": "<service_name>"
}
```

## 🔐 Sécurité

- Images Docker basées sur `python:3.11-slim` pour une surface d'attaque réduite
- Nginx comme reverse proxy pour isolation
- Health checks automatiques
- Restart policy: `unless-stopped`

## 📝 Notes de développement

Les implémentations actuelles utilisent des données mockées. Pour la production :
- Intégrer de vrais modèles IA/ML
- Ajouter l'authentification et l'autorisation
- Implémenter la persistance des données
- Ajouter des logs structurés
- Configurer le monitoring et les métriques
