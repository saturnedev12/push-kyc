import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:push_kyc/app/core/routers/app_router.dart';
import 'package:push_kyc/app/core/utils/session_manager.dart';
import 'package:push_kyc/app/features/authentification/presentation/pages/login_page.dart';
import 'package:toastification/toastification.dart';

import '../../services/navigation_service.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  SessionManager sessionManager;
  ErrorInterceptor(this.sessionManager);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    inspect(err);
    if (err.response != null) {
      if (err.response?.statusCode == 401) {
        log('TOKEN EXPIRED');
        AppRouter.router.goNamed(LoginPage.name);
      } else {
        log('SHOW');
        toastification.show(
          type: ToastificationType.error,
          context:
              NavigationService
                  .navigatorKey
                  .currentContext, // optional if you use ToastificationWrapper
          title: const Text("Oops, quelque chose s'est mal passé."),
          description: Text(_manageResponse(err.response!)),
          autoCloseDuration: const Duration(seconds: 5),

          showProgressBar: false,
          alignment: Alignment.bottomCenter,
          style: ToastificationStyle.flatColored,
        );
      }
    }

    super.onError(err, handler);
  }

  _manageResponse(Response response) {
    final data = response.data;

    if (data != null) {
      final message = data['message'];

      if (message is String && message.trim().isNotEmpty) {
        return message;
      }

      if (message is List) {
        // Join all error messages with a line break or comma
        return message.join('\n');
      }
    }

    // Fallback : message par défaut basé sur le code HTTP
    return _getMessageFromStatusCode(response.statusCode);
  }

  _getMessageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Nous avons rencontré une erreur lors du traitement de votre requête.';
      case 401:
        return "Non autorisé : Vous n'avez pas les permissions nécessaires.";
      case 403:
        return "Accès interdit : Vous n'êtes pas autorisé à accéder à cette ressource.";
      case 404:
        return "Ressource introuvable : La page que vous recherchez n'existe pas.";
      case 405:
        return "Méthode non autorisée : La méthode HTTP utilisée n'est pas supportée pour cette ressource.";
      case 500:
        return "Erreur interne du serveur : Une erreur inattendue s'est produite.";
      case 502:
        return "Bad Gateway : Le serveur a reçu une réponse invalide d'un serveur en amont.";
      case 503:
        return "Service indisponible : Le serveur est temporairement indisponible.";
      default:
        return "Une erreur inconnue s'est produite.";
    }
  }
}
