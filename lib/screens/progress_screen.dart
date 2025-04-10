import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../models/course.dart';
import '../providers/course_provider.dart';
import '../theme/pirate_theme.dart';
import '../theme/pixel_icons.dart';
import 'course_detail_screen.dart';

class ProgressScreen extends ConsumerStatefulWidget {
  const ProgressScreen({super.key});

  @override
  ProgressScreenState createState() => ProgressScreenState();
}

class ProgressScreenState extends ConsumerState<ProgressScreen> with SingleTickerProviderStateMixin {
  // Animation controller for ship movement
  late AnimationController _shipAnimController;
  late Animation<double> _shipBobAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Setup ship bobbing animation
    _shipAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    
    _shipBobAnimation = Tween<double>(begin: 0, end: 1).animate(_shipAnimController);
  }
  
  @override
  void dispose() {
    _shipAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(coursesProvider);
    final completionState = ref.watch(courseCompletionProvider);
    
    // Calculate completion percentage and distance
    int completedCount = completionState.values.where((completed) => completed).length;
    double completionPercentage = courses.isEmpty ? 0 : (completedCount / courses.length) * 100;
    int distanceTraveled = (completionPercentage * 20).round(); // 2000 mile journey
    
    return Scaffold(
      backgroundColor: PirateTheme.oceanDarkBlue,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pirate voyage style header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: PirateTheme.woodBrown.withOpacity(0.6),
                border: Border.all(
                  color: PirateTheme.darkBrown,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'TREASURE VOYAGE',
                    style: GoogleFonts.pressStart2p(
                      textStyle: TextStyle(
                        color: PirateTheme.goldYellow,
                        fontSize: 12,
                        letterSpacing: -1,
                        shadows: [
                          Shadow(
                            color: PirateTheme.blackInk,
                            offset: const Offset(1, 1),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HEALTH: GOOD',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.parrotGreen,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        'WEATHER: CLEAR SKIES',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.skyBlue,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Voyage progress
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: PirateTheme.sandBeige.withOpacity(0.1),
                border: Border.all(
                  color: PirateTheme.darkBrown,
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Treasure map title with icon
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: PixelIcons.map(
                          color: PirateTheme.sandBeige,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'TREASURE MAP',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.goldYellow,
                            fontSize: 10,
                            letterSpacing: -0.5,
                            shadows: [
                              Shadow(
                                color: PirateTheme.blackInk,
                                offset: const Offset(1, 1),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Row(
                    children: [
                      Text(
                        'LEAGUES SAILED: ',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.pixelWhite,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        '$distanceTraveled',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.goldYellow,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Row(
                    children: [
                      Text(
                        'LEAGUES TO TREASURE: ',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.pixelWhite,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Text(
                        '${2000 - distanceTraveled}',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.goldYellow,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Ocean route with ship
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: PirateTheme.darkBrown,
                        width: 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Ocean background
                        Positioned.fill(
                          child: CustomPaint(
                            painter: _OceanRoutePainter(),
                          ),
                        ),
                        
                        // Route markers
                        Positioned(
                          left: 4,
                          top: 4,
                          child: Text(
                            'PORT',
                            style: GoogleFonts.pressStart2p(
                              textStyle: TextStyle(
                                color: PirateTheme.sandBeige,
                                fontSize: 6,
                              ),
                            ),
                          ),
                        ),
                        
                        Positioned(
                          right: 4,
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: PixelIcons.treasureChest(
                                  color: PirateTheme.goldYellow,
                                  size: 10,
                                ),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'X',
                                style: GoogleFonts.pressStart2p(
                                  textStyle: TextStyle(
                                    color: PirateTheme.parrotRed,
                                    fontSize: 6,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Ship position on route (animated)
                        AnimatedBuilder(
                          animation: _shipBobAnimation,
                          builder: (context, child) {
                            // Calculate bobbing effect
                            final bobOffset = math.sin(_shipBobAnimation.value * 2 * math.pi) * 3;
                            
                            return Positioned(
                              left: (MediaQuery.of(context).size.width - 72) * completionPercentage / 100,
                              top: 20 + bobOffset, // Bobbing effect
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: PixelIcons.ship(
                                  color: PirateTheme.goldYellow,
                                  size: 24,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Course completion status with coin icon
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: PixelIcons.coin(
                          color: PirateTheme.goldYellow,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'LESSONS MASTERED: $completedCount/${courses.length}',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.pixelWhite,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Financial Lessons Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  color: PirateTheme.goldYellow,
                ),
                const SizedBox(width: 8),
                Text(
                  'CHOOSE YOUR NEXT CHALLENGE:',
                  style: GoogleFonts.pressStart2p(
                    textStyle: TextStyle(
                      color: PirateTheme.goldYellow,
                      fontSize: 8,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 6,
                  height: 6,
                  color: PirateTheme.goldYellow,
                ),
                Expanded(
                  child: Divider(
                    color: PirateTheme.goldYellow,
                    thickness: 2,
                    height: 16,
                    indent: 8,
                  ),
                ),
              ],
            ),
            
            // Course list scrollable
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  final isCompleted = completionState[course.id] ?? false;
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: PirateTheme.woodBrown.withOpacity(0.3),
                      border: Border.all(
                        color: isCompleted 
                            ? PirateTheme.darkBrown
                            : PirateTheme.goldYellow,
                        width: isCompleted ? 1 : 2,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailScreen(course: course),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Number indicator like menu
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: PirateTheme.darkBrown.withOpacity(0.5),
                                  border: Border.all(
                                    color: isCompleted 
                                        ? PirateTheme.darkBrown
                                        : PirateTheme.goldYellow,
                                    width: 2,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}',
                                  style: GoogleFonts.pressStart2p(
                                    textStyle: TextStyle(
                                      color: isCompleted 
                                          ? PirateTheme.sandBeige.withOpacity(0.7)
                                          : PirateTheme.goldYellow,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              
                              // Course details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            course.title.toUpperCase(),
                                            style: GoogleFonts.pressStart2p(
                                              textStyle: TextStyle(
                                                color: isCompleted 
                                                    ? PirateTheme.sandBeige.withOpacity(0.7)
                                                    : PirateTheme.goldYellow,
                                                fontSize: 8,
                                                letterSpacing: -0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (isCompleted)
                                          SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: PixelIcons.pixelCheck(
                                              color: PirateTheme.goldYellow.withOpacity(0.7),
                                              size: 16,
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      course.description,
                                      style: GoogleFonts.pressStart2p(
                                        textStyle: TextStyle(
                                          color: isCompleted 
                                              ? PirateTheme.pixelWhite.withOpacity(0.5)
                                              : PirateTheme.pixelWhite,
                                          fontSize: 6,
                                          letterSpacing: -0.5,
                                          height: 1.5,
                                        ),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 12,
                                          height: 12,
                                          child: PixelIcons.coin(
                                            color: isCompleted
                                                ? PirateTheme.goldYellow.withOpacity(0.5)
                                                : PirateTheme.goldYellow,
                                            size: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'REWARD: ${course.durationMinutes * 10} COINS',
                                          style: GoogleFonts.pressStart2p(
                                            textStyle: TextStyle(
                                              color: isCompleted 
                                                  ? PirateTheme.goldYellow.withOpacity(0.5)
                                                  : PirateTheme.goldYellow,
                                              fontSize: 6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Pirate-themed action menu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: PirateTheme.darkBrown,
                border: Border.all(
                  color: PirateTheme.goldYellow,
                  width: 2,
                ),
              ),
              child: Text(
                'CHOOSE A CHALLENGE TO EARN DOUBLOONS',
                textAlign: TextAlign.center,
                style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                    color: PirateTheme.goldYellow,
                    fontSize: 8,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ocean painter for the route map
class _OceanRoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint ocean
    final oceanPaint = Paint()
      ..color = PirateTheme.oceanBlue;
    
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      oceanPaint,
    );
    
    // Draw route line (dotted)
    final routePaint = Paint()
      ..color = PirateTheme.sandBeige.withOpacity(0.7)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    // Draw dotted line for the route
    final dashWidth = 5.0;
    final dashSpace = 3.0;
    double startX = 0;
    
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        routePaint,
      );
      startX += dashWidth + dashSpace;
    }
    
    // X marks the spot
    final xPaint = Paint()
      ..color = PirateTheme.parrotRed
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(
      Offset(size.width - 15, size.height / 2 - 5),
      Offset(size.width - 5, size.height / 2 + 5),
      xPaint,
    );
    
    canvas.drawLine(
      Offset(size.width - 15, size.height / 2 + 5),
      Offset(size.width - 5, size.height / 2 - 5),
      xPaint,
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
