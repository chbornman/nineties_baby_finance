import 'package:flutter/material.dart';

/// Pirate-themed pixel styling for our financial app
class PirateTheme {
  // Colors for pirate theme
  static const Color oceanBlue = Color(0xFF0077BE);
  static const Color oceanDarkBlue = Color(0xFF003366);
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color goldYellow = Color(0xFFFFD700);
  static const Color darkBrown = Color(0xFF8B4513);
  static const Color woodBrown = Color(0xFFA0522D);
  static const Color sandBeige = Color(0xFFF5DEB3);
  static const Color blackInk = Color(0xFF000000);
  static const Color pixelWhite = Color(0xFFFFFFFF);
  static const Color parrotGreen = Color(0xFF32CD32);
  static const Color parrotRed = Color(0xFFFF4500);

  // Custom text styles
  static TextStyle pixelTextTitle = TextStyle(
    fontFamily: 'PressStart2P',
    color: goldYellow,
    fontSize: 16,
    letterSpacing: -1,
    height: 1.2,
    shadows: [
      Shadow(
        color: blackInk,
        offset: const Offset(1, 1),
        blurRadius: 0,
      ),
    ],
  );

  static TextStyle pixelTextHeadline = TextStyle(
    fontFamily: 'PressStart2P',
    color: goldYellow,
    fontSize: 14,
    letterSpacing: -1,
    height: 1.2,
    shadows: [
      Shadow(
        color: blackInk,
        offset: const Offset(1, 1),
        blurRadius: 0,
      ),
    ],
  );

  static const TextStyle pixelTextBody = TextStyle(
    fontFamily: 'PressStart2P',
    color: pixelWhite,
    fontSize: 10,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle pixelTextSmall = TextStyle(
    fontFamily: 'PressStart2P',
    color: pixelWhite,
    fontSize: 8,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle pirateDialogText = TextStyle(
    fontFamily: 'PressStart2P',
    color: pixelWhite,
    fontSize: 10,
    letterSpacing: -0.5,
    height: 1.5,
    shadows: [
      Shadow(
        color: blackInk,
        offset: const Offset(1, 1),
        blurRadius: 0,
      ),
    ],
  );

  // Box decoration for scroll containers
  static BoxDecoration scrollDecoration = BoxDecoration(
    color: sandBeige.withOpacity(0.2),
    border: Border.all(
      color: darkBrown,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(0),
  );

  // Button style for pirate-themed buttons
  static ButtonStyle pirateButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: woodBrown,
    foregroundColor: goldYellow,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: pixelTextBody,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: darkBrown, width: 2),
      borderRadius: BorderRadius.circular(0),
    ),
  );

  // Theme data for the app
  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: oceanDarkBlue,
      colorScheme: ColorScheme.dark(
        primary: goldYellow,
        onPrimary: blackInk,
        secondary: parrotGreen,
        onSecondary: blackInk,
        surface: woodBrown,
        onSurface: pixelWhite,
        background: oceanDarkBlue,
        onBackground: pixelWhite,
        error: parrotRed,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: woodBrown,
        foregroundColor: goldYellow,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: pixelTextHeadline.copyWith(fontSize: 16),
      ),
      textTheme: TextTheme(
        displayLarge: pixelTextTitle.copyWith(fontSize: 24),
        displayMedium: pixelTextTitle.copyWith(fontSize: 20),
        displaySmall: pixelTextTitle.copyWith(fontSize: 18),
        headlineMedium: pixelTextHeadline,
        titleLarge: pixelTextHeadline,
        titleMedium: pixelTextHeadline.copyWith(fontSize: 12),
        bodyLarge: pixelTextBody,
        bodyMedium: pixelTextBody,
        bodySmall: pixelTextSmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: pirateButtonStyle,
      ),
      cardTheme: CardTheme(
        color: woodBrown.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: darkBrown, width: 2),
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 4,
      ),
      dividerTheme: const DividerThemeData(
        color: goldYellow,
        thickness: 2,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: goldYellow,
        linearTrackColor: woodBrown.withOpacity(0.5),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: woodBrown,
        selectedItemColor: goldYellow,
        unselectedItemColor: sandBeige.withOpacity(0.7),
        selectedLabelStyle: pixelTextSmall,
        unselectedLabelStyle: pixelTextSmall,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      iconTheme: const IconThemeData(
        color: goldYellow,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: sandBeige.withOpacity(0.1),
        labelStyle: pixelTextBody.copyWith(color: sandBeige),
        hintStyle: pixelTextBody.copyWith(color: sandBeige.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkBrown, width: 2),
          borderRadius: BorderRadius.circular(0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: goldYellow, width: 2),
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return goldYellow;
            }
            return woodBrown;
          },
        ),
        checkColor: MaterialStateProperty.all(woodBrown),
        side: BorderSide(color: darkBrown, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      useMaterial3: false,
    );
  }
}