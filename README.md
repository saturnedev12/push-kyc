# Push KYC

<p align="center" >
    <img src="https://i.postimg.cc/qMhG5ZzT/push-kyc-logo.png" alt="App Logo" width="120" style="border-radius: 60px;" />
</p>

---

## 📖 Introduction

**Push KYC** est une application Flutter réalisée dans le cadre d’un test technique pour un poste de **Développeur Mobile**.  
Elle propose un parcours **KYC (Know Your Customer)** complet : authentification, tableau de bord, saisie des informations personnelles, capture/chargement des justificatifs d’identité, selfie contrôlé et vérification d’adresse.

L’objectif est double : **respect strict des bonnes pratiques de sécurité (OWASP)** et **expérience fiable hors-ligne** grâce à une architecture modulaire et testable.

### 🎯 Ce que l’app couvre

- **Login sécurisé** (JWT) + stockage local chiffré via `flutter_secure_storage`.
- **Dashboard** après connexion, accès rapide au statut KYC.
- **Création & gestion d’un KYC** (informations, documents, selfie, adresse).
- **Offline-first** : enregistrement local (Isar) et **auto-synchronisation** dès le retour du réseau.
- **API mock** Postman pour simuler le backend  
  _(collection fournie dans l’énoncé — voir section API du README)._

### 🧩 Architecture & choix techniques

- **Clean Architecture** (Data / Domain / Presentation) pour la maintenabilité et les tests.
- **Dio + Retrofit + Freezed** pour des DTOs immuables et des appels réseau typés.
- **Isar** pour la persistance locale, **`flutter_secure_storage`** pour les données sensibles (email, token).
- **Google ML Kit Face Detection** (bonus) : contrôle simple _in-app_ qu’un **seul visage** est présent lors du selfie.
- **Photon API** (bonus) : autocomplétion & récupération d’adresse.

### 🔒 Sécurité (OWASP)

- Communication **HTTPS/TLS**, tokens expirables/rotations côté serveur.
- **Aucune donnée sensible en clair** (tokens stockés côté OS : Keychain/Keystore).
- Validation des entrées, gestion d’erreurs non verbeuse, purge sécurisée au logout.

En résumé, **Push KYC** démontre un **parcours KYC complet**, une **gestion robuste du hors-ligne** et une **mise en conformité OWASP**, tout en restant **clair, modulaire et documenté**.

---

## 📱 Présentation de l'application

<div style="background-color: #FFFFFF; padding: 20px; border-radius: 12px; display: flex; flex-wrap: wrap; justify-content: space-between;">
  <img src="https://i.postimg.cc/TY20yfx9/Screenshot-2025-08-21-at-02-07-13.png" alt="Capture 3" width="250" />
  <img src="https://i.postimg.cc/gj41ttJR/Screenshot-2025-08-20-at-15-48-00.png" alt="Capture 3" width="250" />
  <img src="https://i.postimg.cc/j2RGXYst/Screenshot-2025-08-20-at-15-48-28.png" alt="Capture 1" width="250" />
  <img src="https://i.postimg.cc/c1mqJCmH/Screenshot-2025-08-20-at-15-49-26.png" alt="Capture 2" width="250" />
  <img src="https://i.postimg.cc/hPPkQny0/Screenshot-2025-08-20-at-15-51-45.jpg" alt="Capture 3" width="220" style="border-radius: 30px;"/>
    <img src="https://i.postimg.cc/5N7ZwrDW/Screenshot-2025-08-20-at-15-53-37.png" alt="Capture 3" width="250" />
      <img src="https://i.postimg.cc/CxR9JNVB/Screenshot-2025-08-20-at-15-54-20.png" alt="Capture 3" width="250" />

</div>

## ✨ Fonctionnalités principales

- 📸 **Vérification faciale avec Google ML Kit**  
  Détection de visage lors de la prise du selfie avec contrôle de qualité :

  - Validation qu’un **seul visage** est présent.
  - Vérification que l’utilisateur **regarde bien la caméra**.  
    👉 Cette étape est un **élément différenciateur clé** du processus KYC, garantissant la sécurité et l’intégrité des données biométriques.

- 📡 **Détection d’état de connexion Internet**  
  Gestion intelligente du réseau :

  - Vérification en temps réel de la disponibilité d’Internet.
  - Bascule automatique entre **mode en ligne** (connexion au serveur) et **mode hors ligne** (sauvegarde locale).  
    Cela permet à l’application d’être **résiliente même en environnement à faible connectivité**.

- 💾 **Stockage local avec Isar**

  - Persistance des informations utilisateur pour un fonctionnement **offline-first**.
  - Synchronisation automatique avec le serveur dès que la connexion Internet est rétablie.
  - Optimisé pour la **rapidité et la légèreté** sur mobile.

- 🔐 **Stockage sécurisé avec `flutter_secure_storage`**  
  Les données sensibles (comme l’**email utilisateur** et le **token JWT**) sont **chiffrées et stockées de manière sécurisée** :

  - **iOS** → via **Keychain**.
  - **Android** → via **Keystore**.  
    Fonctions disponibles :
  - `saveCredentials(String email, String token)` → sauvegarde.
  - `getCredentials()` → récupération.
  - `hasCredentials()` → vérifie la présence de données locales.  
    👉 Cela assure un **respect strict des recommandations OWASP** concernant la gestion des secrets et des sessions.

- 🗺️ **Récupération d’adresse avec l’API Photon**

  - Intégration de l’API **Photon** pour l’autocomplétion et la récupération d’adresses.
  - Permet aux utilisateurs de **sélectionner rapidement leur adresse** à partir de suggestions basées sur leur saisie.
  - Support multi-langue et **optimisé pour les recherches locales** (utile dans le contexte d’une vérification KYC).  
    👉 Réduit les erreurs manuelles de saisie et améliore l’expérience utilisateur.

- 🔒 **Sécurité (OWASP Compliant)**  
  Mise en place de mesures conformes aux **directives OWASP Mobile & API Security** :

  - **Chiffrement** des données sensibles.
  - **Validation stricte** des entrées utilisateur.
  - **Authentification sécurisée avec JWT** + rotation/expiration des tokens.
  - **Gestion sécurisée des sessions** (logout = purge locale + révocation côté serveur).
  - Protection contre les attaques courantes (XSS, injection, MITM).

- 🧩 **Clean Architecture**

  - Séparation nette en **3 couches** : Data, Domaine, Présentation.
  - Assure **testabilité**, **maintenabilité** et **scalabilité** du code.
  - Respect des bonnes pratiques de développement modernes.

- 🧪 **Tests unitaires & qualité du code**
  - Couverture avec **Flutter Test**.
  - Vérification de la **robustesse des fonctionnalités critiques** (authentification, sauvegarde locale, logique KYC).
  - Intégration continue prévue pour garantir la qualité à chaque livraison.

---

## 🔐 Authentification & Sécurité (OWASP)

Ce projet implémente une authentification moderne et **strictement conforme aux directives OWASP** (Mobile & API Security).  
Objectifs : confidentialité, intégrité, disponibilité — sans compromettre l’UX.

- **Login** via API sécurisée (HTTPS/TLS 1.2+).
- Réception d’un **JWT** (access token) et stockage **local sécurisé**.
- Utilisation de **`flutter_secure_storage`** (Keychain/Keystore) pour enregistrer `email` et `token`.
- **Aucun secret** loggé ni stocké en clair.
- **Rotation/expiration** côté serveur, check du token à chaque démarrage.

---

## 📡 API & Data Layer

Pour les tests et le développement, j’ai mis en place **ma propre structure Postman mock** afin de simuler les endpoints KYC.  
Cela me permet de développer et tester l’intégration Flutter sans dépendre d’un backend réel.

## 🌐 Endpoints Postman Mock

Pour simuler l’API KYC, j’ai créé mes propres **endpoints Postman Mock**.  
Chaque endpoint correspond à une étape spécifique du processus KYC.

---

### 1️⃣ Envoyer les informations personnelles

**Endpoint**

POST /kyc/personal-info

```json
{
  "firstName": "Jean",
  "lastName": "Dupont",
  "email": "jean.dupont@example.com",
  "phoneNumber": "+2250700000000",
  "birthYear": 1990,
  "birthMonth": 6,
  "birthDay": 15,
  "addressName": "Le Plateau, Abidjan",
  "addressLat": 5.345,
  "addressLon": -4.023,
  "residenceCountryCode": "CI",
  "nationalityCountryCode": "CI",
  "postalCode": "00225"
}
```

### 2️⃣ Upload pièce d’identité

POST /kyc/upload-id

Body (multipart/form-data)

```json
type = "CNI"
recto = <file>
verso = <file>
```

### 3️⃣ Upload selfie

POST /kyc/upload-selfie

Body (multipart/form-data)

`selfie = <file>`

#### 4️⃣ Vérifier le statut de validation

GET /kyc/status/{requestId}

```json
{
  "overall": "pending",
  "fields": {
    "firstName": "approved",
    "lastName": "approved",
    "email": "approved",
    "phoneNumber": "approved",
    "birthYear": "approved",
    "birthMonth": "approved",
    "birthDay": "pending",
    "addressName": "approved",
    "addressLat": "approved",
    "addressLon": "pending",
    "residenceCountryCode": "approved",
    "nationalityCountryCode": "approved",
    "postalCode": "approved",
    "typeChoisi": "approved",
    "pathRecto": "pending",
    "pathVerso": "pending",
    "pathPassport": "rejected",
    "pathSelfie": "pending"
  },
  "reasons": {
    "pathPassport": "MRZ not readable"
  },
  "requestId": "kyc_abc123",
  "updatedAt": "2025-08-20T18:00:00Z"
}
```

### 📂 Structure du code

```bash
├── models
│   ├── kyc_fields_dto.dart
│   ├── kyc_status_dto.dart
│   ├── kyc_submission_response.dart
│   └── personal_info_dto.dart
└── providers
    └── kyc_provider.dart
```

---

## 🛠️ Technologies principales utilisées

- **Flutter** `3.29.3` (channel stable)
- **Dart** `3.7.2`
- **Flutter Bloc** → Gestion d’état réactive et scalable
- **Retrofit** → Appels API REST typés et robustes
- **Freezed** → Génération automatique de classes immuables & sealed classes
- **Injectable** → Injection de dépendances automatisée
- **Isar** → Base de données locale rapide & offline-first
- **google_mlkit_face_detection** → Détection de visage pour les selfies

---

## 📂 Architecture du projet

Le projet suit une **Clean Architecture** structurée autour de trois couches principales :

1. **Data Layer** : Sources de données (API, base locale, services externes)
2. **Domain Layer** : Cas d’usage et logique métier (UseCases, repositories abstraits)
3. **Presentation Layer** : UI et gestion d’état avec Flutter Bloc

Arborescence simplifiée des dossiers :

```bash
├── app
│   ├── core
│   │   ├── config
│   │   ├── constants
│   │   ├── data
│   │   │   └── models
│   │   ├── enums
│   │   ├── errors
│   │   ├── extension
│   │   ├── localization
│   │   ├── network
│   │   │   ├── exceptions
│   │   │   ├── interceptors
│   │   │   └── utils
│   │   ├── routers
│   │   ├── services
│   │   ├── themes
│   │   └── utils
│   └── features
│       ├── adress_location
│       │   ├── data
│       │   ├── domain
│       │   └── presentation
│       │       ├── logic
│       │       └── pages
│       │           └── components
│       ├── authentification
│       │   ├── data
│       │   │   ├── database
│       │   │   ├── models
│       │   │   │   ├── local
│       │   │   │   └── remote
│       │   │   ├── network
│       │   │   └── repositories
│       │   ├── domain
│       │   └── presentation
│       ├── birthdate_page
│       │   ├── data
│       │   └── presentation
│       │       └── logic
│       ├── documents
│       │   ├── data
│       │   ├── domaine
│       │   └── presentation
│       │       ├── components
│       │       ├── pages
│       │       └── utils
│       ├── home
│       │   ├── data
│       │   ├── domain
│       │   └── presentation
│       │       ├── components
│       │       ├── logic
│       │       ├── pages
│       │       └── utils
│       ├── kyc_doc
│       │   ├── data
│       │   ├── domain
│       │   └── presentation
│       │       └── logic
│       ├── local_storage
│       │   ├── data
│       │   │   ├── repositories
│       │   │   └── schemas
│       │   └── domain
│       ├── personnal_information
│       │   ├── data
│       │   ├── domain
│       │   └── presentation
│       │       ├── components
│       │       ├── logic
│       │       └── pages
│       ├── photon_adress
│       │   ├── data
│       │   │   ├── models
│       │   │   ├── providers
│       │   │   └── repository
│       │   ├── domain
│       │   │   ├── repositories
│       │   │   └── usecases
│       │   └── presentation
│       │       ├── components
│       │       ├── logic
│       │       └── pages
│       └── selfie
│           ├── data
│           └── presentaion
│               ├── logic
│               └── pages
│                   └── utils
└── main.dart
```
