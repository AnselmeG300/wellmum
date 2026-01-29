# Structure du dossier **Wellmum IAC**

Le répertoire **Wellmum IAC** contient l’ensemble du code d’infrastructure du projet.
Il est organisé en plusieurs sous-dossiers, chacun représentant une couche ou un domaine d’infrastructure.
On distingue deux grandes catégories :

1. **Les dossiers Core (infrastructure de base)**
2. **Les dossiers Application (infrastructure liée aux services applicatifs)**

---

## 1. Dossiers Core

Ces dossiers contiennent le **code d’infrastructure central**, partagé par l’ensemble des applications.
Ils définissent les composants fondamentaux nécessaires au fonctionnement des services.

Les dossiers Core sont :

* **Wellmum Cluster**
* **Wellmum Network**
* **Wellmum Security**
* **Wellmum Stockage**

### Rôle des dossiers Core

Chaque dossier Core contient directement le code Terraform permettant de définir les ressources suivantes :

* **Wellmum Cluster** : création et configuration du cluster (ECS, EKS, ou autre selon le choix retenu).
* **Wellmum Network** : VPC, sous-réseaux, gateways, routage.
* **Wellmum Security** : IAM, rôles, politiques, permissions, security groups.
* **Wellmum Stockage** : stockage persistant (S3, EFS, bases, volumes, etc.).

Ces dossiers sont regroupés sous la notion de **Core Infrastructure**, car ils sont indépendants des applications et assurent les fondations du système.

---

## 2. Dossiers Application

Ces dossiers correspondent à l’infrastructure nécessaire pour exécuter une application spécifique.
Ils dépendent directement de l’infrastructure Core.

Les dossiers Application sont :

* **Wellmum AI**
* **Wellmum API**
* **Wellmum Landing**

### Structure interne des dossiers Application

Contrairement aux dossiers Core, les dossiers Application **ne contiennent pas directement le code d’infrastructure final**.
Ils intègrent **trois sous-dossiers internes**, qui structurent leur code Terraform :

* **modules**: 
* **dev** : pour le provisionnement en environnement de dévéloppement
* **prod** : pour le provisionnement en environnement de production

### Rôle des dossiers Application

Ils orchestrent l’infrastructure nécessaire pour une application spécifique en s’appuyant sur les modules Core.

Concrètement :

* **Wellmum AI** appelle les ressources du Cluster, du Network, de la Security et du Stockage, puis y ajoute son infrastructure spécifique.
* **Wellmum API** fait la même chose, mais avec les besoins propres de l’API.
* **Wellmum Landing** suit la même logique pour son service.

Ces dossiers représentent donc l’infrastructure **dépendante de l’application**, construite au-dessus du Core.

---

## 3. Relation entre Core et Application

La logique complète est la suivante :

1. Les dossiers **Core** définissent l’infrastructure fondamentale.
2. Les dossiers **Application** consomment ces ressources Core pour construire l’environnement d’exécution de chaque service.
3. Les pipelines déclenchent d’abord la construction du **Core**, puis appliquent l’infrastructure **Application**.

Cette séparation permet :

* une maintenance plus simple,
* une réutilisation du Core pour plusieurs applications,
* une meilleure scalabilité,
* un découplage clair entre infrastructure commune et infrastructure spécifique.

