import 'package:flutter/material.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {'name': 'Your Story', 'image': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'Anu', 'image': 'https://i.pravatar.cc/150?img=2'},
      {'name': 'Maya', 'image': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'Akhil', 'image': 'https://i.pravatar.cc/150?img=4'},
      {'name': 'Diya', 'image': 'https://i.pravatar.cc/150?img=5'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.black),
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories section
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage:
                              NetworkImage(stories[index]['image']!),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          stories[index]['name']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // Post 1
            _buildPost(
              username: 'Anu',
              userImage: 'https://i.pravatar.cc/150?img=2',
              postImage:
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
              caption: 'Enjoying the day 🌸',
            ),

            // Post 2
            _buildPost(
              username: 'Maya',
              userImage: 'https://i.pravatar.cc/150?img=3',
              postImage:
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
              caption: 'New vibes ✨',
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String username,
    required String userImage,
    required String postImage,
    required String caption,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          title: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        Image.network(
          postImage,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: const [
              Icon(Icons.favorite_border, size: 28),
              SizedBox(width: 12),
              Icon(Icons.mode_comment_outlined, size: 28),
              SizedBox(width: 12),
              Icon(Icons.send, size: 28),
              Spacer(),
              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Liked by user123 and others',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}