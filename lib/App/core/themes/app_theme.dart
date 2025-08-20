import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kPrimary = Color(0xFF02731E);
  static const Color kPrimaryDark = Color(0xFF025918);
  static const Color kPrimaryDarker = Color(0xFF014011);
  static const Color kAccent = Color(0xFF1C8C24);
  static const Color kSurfaceLight = Color(0xFFF2F2F2);

  static ThemeData get lightTheme {
    final baseScheme = ColorScheme.fromSeed(
      seedColor: kPrimary,
      primary: kPrimary,
      secondary: kAccent,
      surface: Colors.white,
      background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
    );

    final textTheme = GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 1.25,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.3,
        color: Colors.black87,
        decorationColor: Colors.black87,
      ),
      labelLarge: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w600),
      labelMedium: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
    );

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: baseScheme,
      scaffoldBackgroundColor: Colors.white,
      splashFactory: InkRipple.splashFactory,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        toolbarHeight: 56,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: kPrimary,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dividerColor: const Color(0x1F000000),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: kSurfaceLight,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        hintStyle: textTheme.bodyMedium!.copyWith(color: Colors.black45),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled))
              return kPrimary.withOpacity(0.35);
            return kPrimary;
          }),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(52)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
          overlayColor: const WidgetStatePropertyAll(Color(0x1402731E)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(kPrimary),
          textStyle: WidgetStatePropertyAll(textTheme.labelMedium),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          overlayColor: const WidgetStatePropertyAll(Color(0x1402731E)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: const WidgetStatePropertyAll(
            BorderSide(color: kPrimary, width: 1),
          ),
          foregroundColor: const WidgetStatePropertyAll(kPrimary),
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(48)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: kSurfaceLight,
        selectedColor: kPrimary.withOpacity(0.12),
        disabledColor: const Color(0x11000000),
        labelStyle: textTheme.bodyMedium!,
        secondaryLabelStyle: textTheme.bodyMedium!,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: const StadiumBorder(),
        side: BorderSide.none,
        showCheckmark: false,
      ),
      switchTheme: SwitchThemeData(
        trackOutlineWidth: const WidgetStatePropertyAll(0),
        trackColor: WidgetStateProperty.resolveWith((s) {
          if (s.contains(WidgetState.selected))
            return kPrimary.withOpacity(0.55);
          return const Color(0x33000000);
        }),
        thumbColor: WidgetStateProperty.resolveWith((s) {
          if (s.contains(WidgetState.selected)) return kPrimary;
          return Colors.white;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: const BorderSide(color: Color(0x33000000)),
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? kPrimary : Colors.white,
        ),
        checkColor: const WidgetStatePropertyAll(Colors.white),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected)
                  ? kPrimary
                  : const Color(0x33000000),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: StadiumBorder(),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: kPrimaryDark,
        contentTextStyle: textTheme.bodyMedium!.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: kPrimary),
      tabBarTheme: TabBarTheme(
        labelColor: kPrimary,
        unselectedLabelColor: Colors.black54,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: kPrimary, width: 2),
          insets: EdgeInsets.symmetric(horizontal: 24),
        ),
        labelStyle: textTheme.titleMedium,
        unselectedLabelStyle: textTheme.titleMedium,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        titleTextStyle: textTheme.bodyLarge,
        subtitleTextStyle: textTheme.bodyMedium!.copyWith(
          color: Colors.black54,
        ),
        iconColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        tileColor: kSurfaceLight,
      ),
    );
  }
}

/**
#02731E
#025918
#014011
#1C8C24
#F2F2F2

 */
