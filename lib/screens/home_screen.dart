// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'messages_screen.dart'; // Keep your original messages navigation intact

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Instagram's signature clean background
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0.5, // Subtle bottom border line
        centerTitle: false,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily:
                'Bilabong', // If you have the font, otherwise defaults nicely
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Handle Notifications / Likes
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ), // Matches IG DM Icon
            onPressed: () {
              // NAVIGATION: Smoothly slide into your MessagesScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MessagesScreen()),
              );
            },
          ),
        ],
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Stories Section ──────────────────────────────────────────────
            _buildStoriesBar(),

            const Divider(height: 1, thickness: 0.5, color: Colors.grey),

            // ── Mock Feed Post ───────────────────────────────────────────────
            _buildFeedPost(
              username: 'flutter_dev',
              avatarUrl:
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
              location: 'San Francisco, California',
              postImageUrl:
                  'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=600',
              caption:
                  'Building beautiful UIs with Flutter! What do you think of this layout? 🚀 #flutter #ui',
              likes: '1,244 likes',
            ),

            _buildFeedPost(
              username: 'code_craft',
              avatarUrl:
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100',
              location: 'Tokyo, Japan',
              postImageUrl:
                  'https://images.unsplash.com/photo-1504639725590-34d0984388bd?w=600',
              caption: 'Late night coding sessions hit different. ☕💻',
              likes: '856 likes',
            ),
          ],
        ),
      ),

      // ── Bottom Navigation Bar ──────────────────────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0, // Hardcoded active home state for visual layout
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ── Component: Horizontal Stories Bar ──────────────────────────────────────
  Widget _buildStoriesBar() {
    return Container(
      height: 105,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        itemCount: 8,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Your Story bubble
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Your Story',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          // Regular Friend Story Bubble
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.orange, Colors.yellow],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=$index',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text('user_$index', style: const TextStyle(fontSize: 11)),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Component: Individual Instagram Post Card ──────────────────────────────
  Widget _buildFeedPost({
    required String username,
    required String avatarUrl,
    required String location,
    required String postImageUrl,
    required String caption,
    required String likes,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (Avatar + Name)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          key: UniqueKey(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),

        // Media Image
        Image.network(
          postImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 380,
        ),

        // Action Bar (Like, Comment, Share, Bookmark)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),

        // Likes & Caption Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                likes,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 13),
                  children: [
                    TextSpan(
                      text: '$username ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: caption),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
