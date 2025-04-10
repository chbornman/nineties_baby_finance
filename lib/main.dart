import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/main_navigation.dart';
import 'theme/pirate_theme.dart';
import 'theme/pixel_icons.dart';
import 'models/pirate_character.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force portrait orientation for the authentic pixel experience
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Set system UI overlay style for immersive experience
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize Supabase
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL', // Replace with your Supabase URL
    anonKey: 'YOUR_SUPABASE_ANON_KEY', // Replace with your Supabase anon key
  );

  // Allow Google Fonts to fetch Press Start 2P font from the web
  GoogleFonts.config.allowRuntimeFetching = true;

  runApp(const ProviderScope(child: TreasureFinanceApp()));
}

class TreasureFinanceApp extends StatelessWidget {
  const TreasureFinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treasure Finance',
      debugShowCheckedModeBanner: false,
      theme: PirateTheme.themeData,
      themeMode:
          ThemeMode.dark, // Always use dark mode for authentic pirate look
      home: const LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  final List<String> loadingMessages = [
    'Hoisting the sails...',
    'Checking the compass...',
    'Preparing treasure map...',
    'Loading doubloons...',
    'Waking up Hank the parrot...',
    'Polishing the Captain\'s hook...',
    'Calculating compound interest...',
    'Setting course for financial freedom...',
  ];
  String currentMessage = 'Launching treasure voyage...';

  // Animation for waves
  late AnimationController _animationController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animation for waves
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _simulateLoading();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 1));

    // Show loading messages one by one
    for (int i = 0; i < loadingMessages.length; i++) {
      if (mounted) {
        setState(() {
          currentMessage = loadingMessages[i];
        });
      }
      await Future.delayed(const Duration(milliseconds: 600));
    }

    // Navigate to main app after loading
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainNavigation()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PirateTheme.oceanDarkBlue,
      body: Stack(
        children: [
          // Ocean background
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _waveAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: _OceanPainter(waveOffset: _waveAnimation.value),
                );
              },
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'TREASURE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.goldYellow,
                        fontSize: 28,
                        letterSpacing: -1,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: const Offset(2, 2),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'FINANCE',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.goldYellow,
                        fontSize: 28,
                        letterSpacing: -1,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: const Offset(2, 2),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chart Yer Course to Riches',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.sandBeige,
                        fontSize: 10,
                        letterSpacing: -0.5,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: const Offset(1, 1),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Ship animated on ocean
                  SizedBox(
                    width: 250,
                    height: 150,
                    child: AnimatedBuilder(
                      animation: _waveAnimation,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            // Moving ship
                            Positioned(
                              left:
                                  60 +
                                  sin(_waveAnimation.value * 2 * 3.14159) * 5,
                              top:
                                  30 +
                                  sin(_waveAnimation.value * 2 * 3.14159 + 1) *
                                      8,
                              child: SizedBox(
                                width: 120,
                                height: 120,
                                child: PixelIcons.ship(
                                  color: PirateTheme.goldYellow,
                                  size: 120,
                                ),
                              ),
                            ),

                            // Parrot on ship
                            Positioned(
                              left:
                                  135 +
                                  sin(_waveAnimation.value * 2 * 3.14159) * 5,
                              top:
                                  40 +
                                  sin(_waveAnimation.value * 2 * 3.14159 + 1) *
                                      8,
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: PixelIcons.parrot(size: 40),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Dialog from Hank the parrot
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: PirateTheme.woodBrown.withOpacity(0.8),
                      border: Border.all(
                        color: PirateTheme.darkBrown,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: PixelIcons.parrot(size: 30),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HANK:',
                                style: GoogleFonts.pressStart2p(
                                  textStyle: TextStyle(
                                    color: PirateTheme.parrotRed,
                                    fontSize: 8,
                                    letterSpacing: -0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                getRandomDialogue(hank),
                                style: GoogleFonts.pressStart2p(
                                  textStyle: TextStyle(
                                    color: PirateTheme.pixelWhite,
                                    fontSize: 8,
                                    letterSpacing: -0.5,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Loading message
                  Text(
                    currentMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.sandBeige,
                        fontSize: 8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      backgroundColor: PirateTheme.woodBrown.withOpacity(0.5),
                      color: PirateTheme.goldYellow,
                      minHeight: 8,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Press ENTER to set sail',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.goldYellow,
                        fontSize: 10,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OceanPainter extends CustomPainter {
  final double waveOffset;

  _OceanPainter({required this.waveOffset});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint sky
    final skyPaint = Paint()..color = PirateTheme.oceanDarkBlue;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), skyPaint);

    // Paint ocean
    final oceanPaint = Paint()..color = PirateTheme.oceanBlue;

    final oceanPath = Path();
    oceanPath.moveTo(0, size.height * 0.6);

    // Draw wavy ocean surface
    double waveHeight = 10;
    double frequency = 0.05;
    double x = 0;

    while (x < size.width) {
      double y =
          size.height * 0.6 +
          sin((x * frequency) + waveOffset * 10) * waveHeight;

      oceanPath.lineTo(x, y);
      x += 5;
    }

    oceanPath.lineTo(size.width, size.height);
    oceanPath.lineTo(0, size.height);
    oceanPath.close();

    canvas.drawPath(oceanPath, oceanPaint);
  }

  @override
  bool shouldRepaint(covariant _OceanPainter oldDelegate) {
    return oldDelegate.waveOffset != waveOffset;
  }
}
