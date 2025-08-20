import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_kyc/app/core/enums/enums.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';

String entryLabel(EntryStatus s) {
  switch (s) {
    case EntryStatus.none:
      return 'Non saisis';
    case EntryStatus.partial:
      return 'En cours';
    case EntryStatus.full:
      return 'Saisis';
  }
}

Color entryColor(BuildContext ctx, EntryStatus s) {
  switch (s) {
    case EntryStatus.none:
      return CupertinoColors.systemRed.resolveFrom(ctx);
    case EntryStatus.partial:
      return CupertinoColors.systemYellow.resolveFrom(ctx);
    case EntryStatus.full:
      return AppTheme.kPrimary;
  }
}

String verifLabel(VerificationUiStatus s) {
  switch (s) {
    case VerificationUiStatus.enAttente:
      return 'En attente';
    case VerificationUiStatus.valide:
      return 'Validé';
    case VerificationUiStatus.invalide:
      return 'Invalidé';
  }
}

Color verifColor(BuildContext ctx, VerificationUiStatus s) {
  switch (s) {
    case VerificationUiStatus.enAttente:
      return CupertinoColors.systemGrey.resolveFrom(ctx);
    case VerificationUiStatus.valide:
      return CupertinoColors.activeGreen.resolveFrom(ctx);
    case VerificationUiStatus.invalide:
      return CupertinoColors.systemRed.resolveFrom(ctx);
  }
}

String syncLabel(SyncStatus s) {
  switch (s) {
    case SyncStatus.notSynced:
      return 'Non synchronisé';
    case SyncStatus.syncing:
      return 'Synchronisation…';
    case SyncStatus.synced:
      return 'Synchronisé';
  }
}

Color syncColor(BuildContext ctx, SyncStatus s) {
  switch (s) {
    case SyncStatus.notSynced:
      return CupertinoColors.systemGrey2.resolveFrom(ctx);
    case SyncStatus.syncing:
      return CupertinoColors.activeBlue.resolveFrom(ctx);
    case SyncStatus.synced:
      return AppTheme.kPrimary;
  }
}
