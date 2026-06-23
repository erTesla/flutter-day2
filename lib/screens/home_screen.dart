// screens/home_screen.dart
// Instagram-style feed screen with stories and posts.

import 'package:flutter/material.dart';
import '../models/message.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.live_tv_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8),
        children: [
          SizedBox(
            height: 120,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: sampleStories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final story = sampleStories[index];
                return _buildStory(story);
              },
            ),
          ),
          const Divider(height: 1, color: Colors.black12),
          ...samplePosts.map((post) => _buildPostCard(context, post)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 16, color: Colors.white),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 4) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile tab not implemented in this demo.')),
            );
          }
        },
      ),
    );
  }

  Widget _buildStory(Story story) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                story.color,
                story.color.withAlpha((0.7 * 255).round()),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Text(
                story.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          story.name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: post.backgroundColor,
                child: Text(
                  post.avatarLetter,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.user, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Text(post.location, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Container(
          height: 320,
          decoration: BoxDecoration(
            color: post.backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
          ),
          child: const Center(
            child: Icon(Icons.image, color: Colors.white70, size: 80),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 16),
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 16),
                  Icon(Icons.send_outlined),
                ],
              ),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(post.likes, style: const TextStyle(fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${post.user} ', style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${post.timeAgo} ago', style: const TextStyle(color: Colors.black54, fontSize: 12)),
              Text('View comments', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
