import 'package:flutter/material.dart';
import 'messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const List<Map<String, String>> posts = [
  {
    'username': 'alex_photos',
    'profile': 'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
    'post': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5BenM4x5reJwXHc-6eFaDyd1KdAB3-T9NOZDXv9VEWDbKKr20SuDAWxE&s=10',
  },
  {
    'username': 'emma.w',
    'profile': 'https://imageio.forbes.com/specials-images/imageserve/6a10d228090f93af5d993ff9/Inde-Navarrette-/0x0.jpg?format=jpg&width=480',
    'post': 'https://picsum.photos/id/1025/800/800',
  },
  {
    'username': 'john_travels',
    'profile': 'https://i.pinimg.com/236x/d0/1d/3a/d01d3a007ecaaa0b179fb55a82959379.jpg',
    'post': 'https://picsum.photos/id/1043/800/800',
  },
  {
    'username': 'sophia.art',
    'profile': 'https://randomuser.me/api/portraits/women/68.jpg',
    'post': 'https://picsum.photos/id/1062/800/800',
  },
];

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
  'alex_photos',
  'emma.w',
  'john_travels',
  'sophia.art',
  'alex_photos',
  'emma.w',
  'john_travels',
  'sophia.art',
  'alex_photos',
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
  backgroundImage: NetworkImage(
    posts[index % posts.length]['profile']!,
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
  radius: 20,
  backgroundImage: NetworkImage(
    posts[index % posts.length]['profile']!,
  ),
),

   title: Text(
  posts[index % posts.length]['username']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          trailing: const Icon(Icons.more_horiz),
        ),

        Image.network(
  posts[index % posts.length]['post']!,
  height: 350,
  width: double.infinity,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      height: 350,
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.broken_image),
      ),
    );
  },
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

        Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: Text(
    'Liked by ${posts[(index + 1) % posts.length]['username']} and 128 others',
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: [
      TextSpan(
        text: '${posts[index % posts.length]['username']} ',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const TextSpan(
        text:
            'Enjoying another beautiful day and sharing moments with everyone ✨',
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