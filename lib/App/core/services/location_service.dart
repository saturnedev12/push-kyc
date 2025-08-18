// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:injectable/injectable.dart';
// import 'package:leboncoursier_customer/app/core/constants/constants.dart';

// @lazySingleton
// class LocationService {
//   final ValueNotifier<bool> locationServiceStatus = ValueNotifier(false);
//   final ValueNotifier<LocationPermission> locationPermissionStatus =
//       ValueNotifier(LocationPermission.denied);

//   LocationService() {
//     _init();
//   }

//   void _init() async {
//     await checkPermission();
//   }

//   /// Vérifie et demande les permissions si nécessaire
//   Future<void> checkPermission() async {
//     await checkLocationServiceStatus();
//     if (locationServiceStatus.value) {
//       await checkLocationPermissionStatus();
//     }
//   }

//   /// Vérifie si le service de localisation est activé
//   Future<void> checkLocationServiceStatus() async {
//     locationServiceStatus.value = await Geolocator.isLocationServiceEnabled();
//   }

//   /// Vérifie le statut des permissions de localisation
//   Future<void> checkLocationPermissionStatus() async {
//     var permission = await Geolocator.checkPermission();
//     locationPermissionStatus.value = permission;
//   }

//   /// Demande l'activation des services de localisation
//   Future<void> requestLocationService() async {
//     if (!(await Geolocator.isLocationServiceEnabled())) {
//       await Geolocator.openLocationSettings();
//     }
//   }

//   /// Demande la permission de localisation
//   Future<void> requestLocationPermission() async {
//     var permission = await Geolocator.requestPermission();
//     locationPermissionStatus.value = permission;

//     if (permission == LocationPermission.deniedForever) {
//       log("Permission bloquée définitivement. Demande à l'utilisateur d'ouvrir les paramètres.");
//     }
//   }

//   /// Ouvre les paramètres de l'application pour modifier les permissions
//   Future<void> openAppSettings() async {
//     await openAppSettings();
//   }

//   /// Ouvre les paramètres de localisation
//   Future<void> openLocationSettings() async {
//     await Geolocator.openLocationSettings();
//   }

//   /// Récupère la position actuelle
//   Future<Position?> getCurrentPosition() async {
//     if (!await Geolocator.isLocationServiceEnabled()) {
//       log("Les services de localisation sont désactivés.");
//       return null;
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.deniedForever) {
//         log("Permission refusée définitivement.");
//         return null;
//       }
//     }

//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       log(" ${position.latitude}, ${position.longitude}",
//           name: "Position actuelle :");
//       currentPosition = LatLng(position.latitude, position.longitude);
//       return position;
//     } else {
//       log("Permission refusée.");
//       return null;
//     }
//   }
// }
