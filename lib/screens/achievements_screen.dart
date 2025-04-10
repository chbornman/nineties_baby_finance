import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/pirate_theme.dart';
import '../theme/pixel_icons.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> with SingleTickerProviderStateMixin {
  // Placeholder values
  final int currentStreak = 7; // 7 days streak
  final int longestStreak = 14; // 14 days longest streak
  final List<bool> lastWeekActivity = const [true, true, true, false, true, true, true]; // Last 7 days activity
  
  late AnimationController _coinAnimationController;
  late Animation<double> _coinAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize animations
    _coinAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _coinAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _coinAnimationController, curve: Curves.easeInOut)
    );
  }
  
  @override
  void dispose() {
    _coinAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TREASURE'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Streak Card
            _buildStreakCard(context),
            
            const SizedBox(height: 24),
            
            // Achievement Categories
            Text(
              'MY TREASURE CHEST',
              style: PirateTheme.pixelTextHeadline,
            ),
            const SizedBox(height: 16),
            
            // Achievement Categories Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildAchievementCategory(
                  context, 
                  'INVESTING', 
                  'treasures', 
                  PirateTheme.woodBrown, 
                  PirateTheme.goldYellow,
                  '3/8'
                ),
                _buildAchievementCategory(
                  context, 
                  'SAVING', 
                  'coins', 
                  PirateTheme.woodBrown, 
                  PirateTheme.goldYellow,
                  '2/5'
                ),
                _buildAchievementCategory(
                  context, 
                  'BUDGETING', 
                  'map', 
                  PirateTheme.woodBrown, 
                  PirateTheme.goldYellow,
                  '4/6'
                ),
                _buildAchievementCategory(
                  context, 
                  'DEBT', 
                  'ship', 
                  PirateTheme.woodBrown, 
                  PirateTheme.goldYellow,
                  '1/7'
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Achievements
            Text(
              'RECENT LOOT',
              style: PirateTheme.pixelTextHeadline,
            ),
            const SizedBox(height: 16),
            
            _buildRecentAchievement(
              context,
              'FIRST VOYAGE',
              'Completed your first financial lesson',
              'treasures',
              PirateTheme.goldYellow,
              '100 COINS',
              DateTime.now().subtract(const Duration(days: 7)),
            ),
            
            _buildRecentAchievement(
              context,
              'STEADY SAILING',
              'Logged in for 5 consecutive days',
              'ship',
              PirateTheme.goldYellow,
              '250 COINS',
              DateTime.now().subtract(const Duration(days: 2)),
            ),
            
            _buildRecentAchievement(
              context,
              'TREASURE MAPPER',
              'Created your first monthly budget',
              'map',
              PirateTheme.goldYellow,
              '500 COINS',
              DateTime.now().subtract(const Duration(days: 1)),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStreakCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: PirateTheme.woodBrown,
        border: Border.all(
          color: PirateTheme.darkBrown,
          width: 2,
        ),
        borderRadius: BorderRadius.zero,
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
        children: [
          // Streak header
          Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: PixelIcons.treasureChest(
                  color: PirateTheme.goldYellow,
                  size: 48,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TREASURE STREAK',
                    style: PirateTheme.pixelTextBody.copyWith(
                      color: PirateTheme.goldYellow,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$currentStreak',
                        style: PirateTheme.pixelTextHeadline.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'DAYS',
                        style: PirateTheme.pixelTextSmall.copyWith(
                          color: PirateTheme.goldYellow,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'BEST VOYAGE',
                    style: PirateTheme.pixelTextSmall.copyWith(
                      color: PirateTheme.sandBeige,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$longestStreak DAYS',
                    style: PirateTheme.pixelTextBody.copyWith(
                      color: PirateTheme.goldYellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Streak calendar for last 7 days
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LAST 7 DAYS',
                style: PirateTheme.pixelTextSmall.copyWith(
                  color: PirateTheme.sandBeige,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) => _buildDayIndicator(
                    context, 
                    _getDayLabel(index), 
                    lastWeekActivity[index],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Streak benefit message
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: PirateTheme.oceanDarkBlue.withOpacity(0.3),
              border: Border.all(
                color: PirateTheme.oceanBlue,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: PixelIcons.parrot(
                    color: PirateTheme.parrotGreen,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'SQUAWK! KEEP YER STREAK GOIN\' FOR 10 DAYS TO EARN THE "LOYAL CREW" BADGE! SQUAWK!',
                    style: PirateTheme.pixelTextSmall.copyWith(
                      color: PirateTheme.pixelWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDayIndicator(BuildContext context, String day, bool completed) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: completed 
                ? PirateTheme.goldYellow 
                : PirateTheme.oceanDarkBlue.withOpacity(0.3),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: PirateTheme.darkBrown,
              width: 2,
            ),
          ),
          child: Center(
            child: completed
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: PixelIcons.coin(
                      color: PirateTheme.darkBrown,
                      size: 20,
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          day,
          style: PirateTheme.pixelTextSmall.copyWith(
            color: completed 
                ? PirateTheme.goldYellow 
                : PirateTheme.sandBeige.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
  
  String _getDayLabel(int daysAgo) {
    final weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final today = DateTime.now();
    final date = today.subtract(Duration(days: 6 - daysAgo));
    return weekdays[date.weekday - 1];
  }
  
  Widget _buildAchievementCategory(
    BuildContext context, 
    String title, 
    String iconType, 
    Color backgroundColor, 
    Color iconColor,
    String progress,
  ) {
    Widget iconWidget;
    
    // Choose the appropriate pixel icon based on the iconType
    switch (iconType) {
      case 'treasures':
        iconWidget = PixelIcons.treasureChest(color: iconColor, size: 32);
        break;
      case 'coins':
        iconWidget = PixelIcons.coin(color: iconColor, size: 32);
        break;
      case 'map':
        iconWidget = PixelIcons.map(color: iconColor, size: 32);
        break;
      case 'ship':
        iconWidget = PixelIcons.ship(color: iconColor, size: 32);
        break;
      default:
        iconWidget = PixelIcons.coin(color: iconColor, size: 32);
    }
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: PirateTheme.darkBrown,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 0,
            spreadRadius: 1,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigation would go here
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedBuilder(
              animation: _coinAnimation,
              builder: (context, child) {
                // Add a subtle floating animation to the icon
                final yOffset = math.sin(_coinAnimation.value * math.pi * 2) * 3;
                
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, yOffset),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: iconWidget,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      title,
                      style: PirateTheme.pixelTextBody.copyWith(
                        color: PirateTheme.goldYellow,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      progress,
                      style: PirateTheme.pixelTextSmall.copyWith(
                        color: PirateTheme.sandBeige,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildRecentAchievement(
    BuildContext context,
    String title,
    String description,
    String iconType,
    Color iconColor,
    String points,
    DateTime earnedOn,
  ) {
    Widget iconWidget;
    
    // Choose the appropriate pixel icon based on the iconType
    switch (iconType) {
      case 'treasures':
        iconWidget = PixelIcons.treasureChest(color: iconColor, size: 32);
        break;
      case 'coins':
        iconWidget = PixelIcons.coin(color: iconColor, size: 32);
        break;
      case 'map':
        iconWidget = PixelIcons.map(color: iconColor, size: 32);
        break;
      case 'ship':
        iconWidget = PixelIcons.ship(color: iconColor, size: 32);
        break;
      default:
        iconWidget = PixelIcons.coin(color: iconColor, size: 32);
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
            spreadRadius: 1,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: iconWidget,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: PirateTheme.pixelTextBody.copyWith(
                    color: PirateTheme.goldYellow,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: PirateTheme.pixelTextSmall.copyWith(
                    color: PirateTheme.pixelWhite,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'PLUNDERED ${_formatDate(earnedOn)}',
                  style: PirateTheme.pixelTextSmall.copyWith(
                    color: PirateTheme.sandBeige.withOpacity(0.7),
                    fontSize: 6,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: PirateTheme.oceanDarkBlue.withOpacity(0.5),
              border: Border.all(
                color: PirateTheme.oceanBlue,
                width: 1,
              ),
            ),
            child: Text(
              points,
              style: PirateTheme.pixelTextSmall.copyWith(
                color: PirateTheme.goldYellow,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'TODAY';
    } else if (difference.inDays == 1) {
      return 'YESTERDAY';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} DAYS AGO';
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }
}
