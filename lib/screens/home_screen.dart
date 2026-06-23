// screens/home_screen.dart
// Instagram-style landing screen with feed, stories, and navigation.

import 'package:flutter/material.dart';
import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  static const List<String> storyUsers = [
    'alex',
    'bella',
    'cam',
    'dani',
    'emma',
    'finn',
    'gabi',
    'henry',
  ];

  final List<Map<String, String>> feedPosts = [
    {
      'user': 'alex',
      'caption': 'Sunset views from the rooftop.',
      'likes': '12.4k',
    },
    {
      'user': 'bella',
      'caption': 'Coffee and good vibes only.',
      'likes': '8.7k',
    },
    {
      'user': 'cam',
      'caption': 'Weekend hiking adventure.',
      'likes': '5.6k',
    },
  ];

  Widget _buildStory(String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFDE0046), Color(0xFFF7A34B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPost(Map<String, String> post) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const CircleAvatar(child: Text('A')),
            title: Text(
              post['user']!.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.more_horiz),
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 80,
                color: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 16),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 16),
                    Icon(Icons.send_outlined),
                    Spacer(),
                    Icon(Icons.bookmark_border),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${post['likes']} likes',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: '${post['user']!.toUpperCase()} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: post['caption']),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'View all comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeed() {
    return ListView(
      children: [
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: storyUsers.length,
            itemBuilder: (context, index) => _buildStory(storyUsers[index]),
          ),
        ),
        const SizedBox(height: 8),
        ...feedPosts.map(_buildPost),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProfilePlaceholder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.person_outline, size: 88, color: Colors.grey),
          SizedBox(height: 16),
          Text('Profile tab placeholder', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('Tap the messages tab to browse your inbox.'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      _buildFeed(),
      const MessagesScreen(),
      _buildProfilePlaceholder(),
    ];

    final appBarTitles = ['Instagram', 'Messages', 'Profile'];

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: Text(
          appBarTitles[currentIndex],
          style: const TextStyle(
            fontSize: 26,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.send_outlined), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
