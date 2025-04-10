// widgets/main_navigation.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/progress_screen.dart';
import '../screens/achievements_screen.dart';
import '../screens/community_screen.dart';
import '../theme/pirate_theme.dart';
import '../theme/pixel_icons.dart';
import '../models/pirate_character.dart';

final selectedTabProvider = StateProvider<int>((ref) => 0);

class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);

    final screens = [
      const ProgressScreen(),
      const AchievementsScreen(),
      const CommunityScreen(),
    ];

    return Scaffold(
      backgroundColor: PirateTheme.oceanDarkBlue,
      appBar: AppBar(
        title: Text(
          "90's BABY PIRATE CREW",
          style: GoogleFonts.pressStart2p(
            textStyle: TextStyle(
              color: PirateTheme.goldYellow,
              fontSize: 14, // Slightly smaller to fit the longer title
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
        backgroundColor: PirateTheme.woodBrown,
        centerTitle: true,
        elevation: 4,
      ),

      // Captain's dialogue section
      body: Column(
        children: [
          // Captain's advice
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: PirateTheme.woodBrown.withOpacity(0.7),
              border: Border(
                bottom: BorderSide(color: PirateTheme.darkBrown, width: 2),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pirate Captain icon - could be replaced with actual image
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: PirateTheme.darkBrown, width: 2),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text('👨‍✈️', style: const TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CAPTAIN:',
                        style: GoogleFonts.pressStart2p(
                          textStyle: TextStyle(
                            color: PirateTheme.goldYellow,
                            fontSize: 8,
                            letterSpacing: -0.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        getRandomDialogue(captain),
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

          // Main content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: PirateTheme.darkBrown, width: 2),
                color: PirateTheme.oceanDarkBlue,
              ),
              margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: screens[selectedTab],
            ),
          ),
        ],
      ),

      // Custom bottom navigation designed like a ship's deck
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: PirateTheme.woodBrown,
          boxShadow: [
            BoxShadow(
              color: PirateTheme.blackInk.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
          border: Border(
            top: BorderSide(color: PirateTheme.darkBrown, width: 3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                'VOYAGE',
                0,
                selectedTab,
                ref,
                PixelIcons.ship(
                  color:
                      selectedTab == 0
                          ? PirateTheme.goldYellow
                          : PirateTheme.sandBeige.withOpacity(0.6),
                  size: 28,
                ),
              ),
              _buildNavItem(
                context,
                'TREASURE',
                1,
                selectedTab,
                ref,
                PixelIcons.treasureChest(
                  color:
                      selectedTab == 1
                          ? PirateTheme.goldYellow
                          : PirateTheme.sandBeige.withOpacity(0.6),
                  size: 28,
                ),
              ),
              _buildNavItem(
                context,
                'CREW',
                2,
                selectedTab,
                ref,
                PixelIcons.parrot(
                  color:
                      selectedTab == 2
                          ? null // Use default parrot colors
                          : PirateTheme.sandBeige.withOpacity(0.6),
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String label,
    int index,
    int selectedTab,
    WidgetRef ref,
    Widget icon,
  ) {
    final isSelected = selectedTab == index;

    return InkWell(
      onTap: () {
        ref.read(selectedTabProvider.notifier).state = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border:
              isSelected
                  ? Border.all(color: PirateTheme.goldYellow, width: 2)
                  : null,
          color: isSelected ? PirateTheme.darkBrown : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30, width: 30, child: icon),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.pressStart2p(
                textStyle: TextStyle(
                  color:
                      isSelected
                          ? PirateTheme.goldYellow
                          : PirateTheme.sandBeige.withOpacity(0.7),
                  fontSize: 8,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
