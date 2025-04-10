import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import '../models/course.dart';
import '../providers/course_provider.dart';
import '../theme/pirate_theme.dart';
import '../theme/pixel_icons.dart';

class CourseDetailScreen extends ConsumerStatefulWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  ConsumerState<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends ConsumerState<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late AnimationController _treasureAnimController;
  late Animation<double> _treasureAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _treasureAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    
    _treasureAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _treasureAnimController, curve: Curves.easeInOut)
    );
  }
  
  @override
  void dispose() {
    _treasureAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.title.toUpperCase()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: PixelIcons.pixelCheck(
                color: PirateTheme.goldYellow,
                size: 24,
              ),
            ),
            onPressed: () {
              ref.read(courseCompletionProvider.notifier).markAsCompleted(widget.course.id);
              Navigator.pop(context);
            },
            tooltip: 'Mark as completed',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PirateTheme.woodBrown,
                border: Border.all(
                  color: PirateTheme.darkBrown,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 0,
                    spreadRadius: 2,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: PixelIcons.map(
                          color: PirateTheme.goldYellow,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.course.title.toUpperCase(),
                          style: PirateTheme.pixelTextHeadline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: PixelIcons.ship(
                          color: PirateTheme.sandBeige,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'VOYAGE TIME: ${widget.course.durationMinutes} MINUTES',
                        style: PirateTheme.pixelTextSmall.copyWith(
                          color: PirateTheme.sandBeige,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.course.topics.map((topic) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: PirateTheme.oceanDarkBlue.withOpacity(0.5),
                        border: Border.all(
                          color: PirateTheme.oceanBlue,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        topic.toUpperCase(),
                        style: PirateTheme.pixelTextSmall.copyWith(
                          color: PirateTheme.goldYellow,
                          fontSize: 6,
                        ),
                      ),
                    )).toList(),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Course description
            Text(
              'CAPTAIN\'S LOG',
              style: PirateTheme.pixelTextHeadline,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: PirateTheme.sandBeige.withOpacity(0.1),
                border: Border.all(
                  color: PirateTheme.darkBrown,
                  width: 2,
                ),
              ),
              child: Text(
                widget.course.description,
                style: PirateTheme.pixelTextBody.copyWith(
                  color: PirateTheme.pixelWhite,
                  fontSize: 9,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Placeholder content
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PixelIcons.treasureChest(
                    color: PirateTheme.goldYellow,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'TREASURE MAP',
                  style: PirateTheme.pixelTextHeadline,
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Sample lessons
            _buildLessonItem(context, 1, 'FIRST LANDFALL: INTRO TO ${widget.course.title.toUpperCase()}'),
            _buildLessonItem(context, 2, 'NAVIGATION SKILLS: KEY CONCEPTS'),
            _buildLessonItem(context, 3, 'TREASURE HUNTING: PRACTICAL EXAMPLES'),
            _buildLessonItem(context, 4, 'AVOIDING THE KRAKEN: COMMON PITFALLS'),
            _buildLessonItem(context, 5, 'CHARTING FUTURE VOYAGES: NEXT STEPS'),
            
            const SizedBox(height: 40),
            
            // Complete course button
            AnimatedBuilder(
              animation: _treasureAnimation,
              builder: (context, child) {
                final scale = 1.0 + (_treasureAnimation.value * 0.05);
                
                return Transform.scale(
                  scale: scale,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(courseCompletionProvider.notifier).markAsCompleted(widget.course.id);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: PirateTheme.woodBrown,
                        foregroundColor: PirateTheme.goldYellow,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: PirateTheme.darkBrown,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: PixelIcons.treasureChest(
                              color: PirateTheme.goldYellow,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'CLAIM THE TREASURE',
                            style: PirateTheme.pixelTextBody.copyWith(
                              color: PirateTheme.goldYellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLessonItem(BuildContext context, int lessonNumber, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: PirateTheme.woodBrown.withOpacity(0.5),
        border: Border.all(
          color: PirateTheme.darkBrown,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: PirateTheme.oceanDarkBlue,
            border: Border.all(
              color: PirateTheme.oceanBlue,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              lessonNumber.toString(),
              style: PirateTheme.pixelTextBody.copyWith(
                color: PirateTheme.goldYellow,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: PirateTheme.pixelTextSmall.copyWith(
            color: PirateTheme.pixelWhite,
          ),
        ),
        trailing: SizedBox(
          width: 24,
          height: 24,
          child: PixelIcons.coin(
            color: PirateTheme.goldYellow,
            size: 24,
          ),
        ),
        onTap: () {
          // Future implementation: play the lesson
        },
      ),
    );
  }
}