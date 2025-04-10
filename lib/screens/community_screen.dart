import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/pirate_theme.dart';
import '../theme/pixel_icons.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  Future<void> _launchDiscord() async {
    final Uri url = Uri.parse('https://discord.gg/90sbabyfinance');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CREW'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Meetings Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: PirateTheme.oceanDarkBlue,
                border: Border.all(
                  color: PirateTheme.goldYellow,
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
                        width: 30,
                        height: 30,
                        child: PixelIcons.parrot(
                          color: PirateTheme.parrotGreen,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'WEEKLY CREW MEETUPS',
                        style: PirateTheme.pixelTextHeadline.copyWith(
                          color: PirateTheme.goldYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'JOIN YER FELLOW PIRATES EVERY MONDAY AT 8:00 PM EST FOR TALKS ON TREASURE HUNTING, INVESTMENT VOYAGES, AND Q&A WITH FINANCIAL BUCCANEERS.',
                    style: PirateTheme.pixelTextBody.copyWith(
                      color: PirateTheme.pixelWhite,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: PirateTheme.woodBrown,
                      border: Border.all(
                        color: PirateTheme.darkBrown,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: PixelIcons.map(
                            color: PirateTheme.sandBeige,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'EVERY MONDAY',
                          style: PirateTheme.pixelTextSmall.copyWith(
                            color: PirateTheme.goldYellow,
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: PixelIcons.coin(
                            color: PirateTheme.sandBeige,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '8:00 PM EST',
                          style: PirateTheme.pixelTextSmall.copyWith(
                            color: PirateTheme.goldYellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to calendar functionality would go here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PirateTheme.woodBrown,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                          const Icon(Icons.add),
                          const SizedBox(width: 8),
                          Text(
                            'ADD TO YER LOG',
                            style: PirateTheme.pixelTextBody.copyWith(
                              color: PirateTheme.goldYellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Discord Section
            Container(
              padding: const EdgeInsets.all(20),
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
                        width: 30,
                        height: 30,
                        child: PixelIcons.ship(
                          color: PirateTheme.goldYellow,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'JOIN OUR FLEET',
                        style: PirateTheme.pixelTextHeadline.copyWith(
                          color: PirateTheme.goldYellow,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'SAIL WITH OTHER PIRATES LEARNING ABOUT FINANCE, SHARE TREASURE MAPS, ASK QUESTIONS, AND BUILD YER CREW. OUR DISCORD FLEET IS ACTIVE 24/7 WITH CHANNELS FOR DIFFERENT TREASURE HUNTING TOPICS.',
                    style: PirateTheme.pixelTextBody.copyWith(
                      color: PirateTheme.pixelWhite,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _launchDiscord,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5865F2), // Discord blue
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.launch, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            'JOIN DISCORD SERVER',
                            style: PirateTheme.pixelTextBody.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Community Stats
            Text(
              'CREW STATS',
              style: PirateTheme.pixelTextHeadline,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard(context, '2,500+', 'PIRATES'),
                _buildStatCard(context, '120+', 'ISLANDS'),
                _buildStatCard(context, '15+', 'VOYAGES MONTHLY'),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Upcoming Events Preview
            Text(
              'UPCOMING VOYAGES',
              style: PirateTheme.pixelTextHeadline,
            ),
            const SizedBox(height: 16),
            _buildEventCard(
              context,
              'TREASURE HUNTING 101',
              'MAY 15, 2025 • 7:00 PM EST',
              'Learn the basics of investing from certified financial buccaneers.',
            ),
            const SizedBox(height: 12),
            _buildEventCard(
              context,
              'ESCAPE DEBT ISLAND',
              'MAY 22, 2025 • 7:00 PM EST',
              'Discover proven methods to eliminate debt and build your treasure chest.',
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: PirateTheme.pixelTextHeadline.copyWith(
              color: PirateTheme.goldYellow,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: PirateTheme.pixelTextSmall.copyWith(
              color: PirateTheme.sandBeige,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _buildEventCard(BuildContext context, String title, String date, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PirateTheme.woodBrown.withOpacity(0.7),
        border: Border.all(
          color: PirateTheme.darkBrown,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: PirateTheme.pixelTextBody.copyWith(
              color: PirateTheme.goldYellow,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: PirateTheme.oceanDarkBlue.withOpacity(0.5),
              border: Border.all(
                color: PirateTheme.oceanBlue,
                width: 1,
              ),
            ),
            child: Text(
              date,
              style: PirateTheme.pixelTextSmall.copyWith(
                color: PirateTheme.sandBeige,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: PirateTheme.pixelTextSmall.copyWith(
              color: PirateTheme.pixelWhite,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: PirateTheme.oceanDarkBlue,
                border: Border.all(
                  color: PirateTheme.oceanBlue,
                  width: 1,
                ),
              ),
              child: Text(
                'VIEW MAP',
                style: PirateTheme.pixelTextSmall.copyWith(
                  color: PirateTheme.goldYellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
