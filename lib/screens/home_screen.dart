import 'package:flutter/material.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,

        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: ListView(
        children: [

          // STORIES
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {

                final names = [
                  'Your Story',
                  'Alice',
                  'Bob',
                  'Carol',
                  'David',
                  'Eva',
                  'Frank',
                  'Grace',
                  'Henry',
                  'Isla',
                ];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [

                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFF58529),
                              Color(0xFFDD2A7B),
                              Color(0xFF8134AF),
                              Color(0xFF515BD4),
                            ],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade300,
                          child: Text(
                            names[index][0],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      SizedBox(
                        width: 70,
                        child: Text(
                          names[index],
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          ...List.generate(
            5,
            (index) => _buildPost(index),
          ),
        ],
      ),
    );
  }

  Widget _buildPost(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // POST HEADER
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text(
              String.fromCharCode(65 + index),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),

          title: Text(
            'user_$index',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          trailing: const Icon(Icons.more_horiz),
        ),

        // IMAGE PLACEHOLDER
        Container(
          height: 350,
          width: double.infinity,
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(
              Icons.image,
              size: 80,
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ACTION BUTTONS
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Icon(Icons.favorite_border, size: 28),

              SizedBox(width: 16),

              Icon(Icons.mode_comment_outlined, size: 28),

              SizedBox(width: 16),

              Icon(Icons.send_outlined, size: 28),

              Spacer(),

              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        const SizedBox(height: 10),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Liked by alex and 128 others',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'user ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'This is a sample Instagram-style post for our Flutter clone project.',
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'View all comments',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}