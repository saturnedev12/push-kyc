# Push KYC

<p align="center" >
    <img src="https://i.postimg.cc/qMhG5ZzT/push-kyc-logo.png" alt="App Logo" width="120" style="border-radius: 60px;" />
</p>

---

## 📖 Introduction

**Push KYC** est une application Flutter développée dans le cadre d’un test technique pour un poste de **Développeur Senior** chez **Push CI**.  
L’application propose un parcours **KYC (Know Your Customer)** complet, permettant la vérification d’identité des utilisateurs via la collecte de documents, de selfies, d’informations personnelles et d’adresses.

Elle met en avant une architecture propre et modulaire (Clean Architecture), une gestion **offline-first**, ainsi qu’une conformité stricte aux recommandations de sécurité **OWASP**.

---

## 📱 Présentation de l'application

<div style="background-color: #FFFFFF; padding: 20px; border-radius: 12px; display: flex; flex-wrap: wrap; justify-content: space-between;">
  <img src="https://i.postimg.cc/gj41ttJR/Screenshot-2025-08-20-at-15-48-00.png" alt="Capture 3" width="250" />
  <img src="https://i.postimg.cc/j2RGXYst/Screenshot-2025-08-20-at-15-48-28.png" alt="Capture 1" width="250" />
  <img src="https://i.postimg.cc/c1mqJCmH/Screenshot-2025-08-20-at-15-49-26.png" alt="Capture 2" width="250" />
  <img src="https://i.postimg.cc/hPPkQny0/Screenshot-2025-08-20-at-15-51-45.jpg" alt="Capture 3" width="220" style="border-radius: 30px;"/>
    <img src="https://i.postimg.cc/5N7ZwrDW/Screenshot-2025-08-20-at-15-53-37.png" alt="Capture 3" width="250" />
      <img src="https://i.postimg.cc/CxR9JNVB/Screenshot-2025-08-20-at-15-54-20.png" alt="Capture 3" width="250" />

</div>

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

## ✨ Fonctionnalités principales

- 📸 **Vérification faciale avec Google ML Kit**
  Détection de visage lors de la prise du selfie (contrôle qu’un seul visage est présent et que l’utilisateur regarde bien la caméra).
  👉 Cette fonctionnalité est au cœur du processus KYC et constitue un élément différenciateur majeur.

- 📡 **Détection d’état de connexion Internet**
  Vérification en temps réel de l’état du réseau afin de basculer automatiquement entre mode en ligne et mode hors ligne.

- 💾 **Stockage local avec Isar**
  Sauvegarde sécurisée des informations utilisateur pour une utilisation **offline-first**.
  Les données collectées peuvent être synchronisées avec le serveur une fois la connexion rétablie.

- 🔒 **Sécurité**
  Respect strict des **directives OWASP** pour le développement sécurisé (chiffrement, validation des entrées, gestion sécurisée des sessions).

- 🧩 **Clean Architecture**
  Séparation claire des couches (données, domaine, présentation) pour assurer testabilité, évolutivité et maintenabilité.

- 🧪 **Tests unitaires**
  Mis en place avec **Flutter Test** afin de garantir la robustesse et la fiabilité de l’application.

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
