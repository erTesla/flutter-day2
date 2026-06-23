import 'package:flutter/material.dart';
import '../screens/messages_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 56,
        leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            letterSpacing: -0.8,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
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
        padding: const EdgeInsets.only(bottom: 16),
        children: [
          const SizedBox(height: 8),
          _SectionHeader(
            title: 'Stories',
            actionLabel: 'Watch all',
            onTap: () {},
          ),
          SizedBox(
            height: 116,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return _StoryChip(story: _stories[index]);
              },
            ),
          ),
          const SizedBox(height: 12),
          ..._posts.map(
            (post) => _InstagramPostCard(post: post),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _Story {
  const _Story({
    required this.name,
    required this.initials,
    required this.colors,
  });

  final String name;
  final String initials;
  final List<Color> colors;
}

class _Post {
  const _Post({
    required this.name,
    required this.handle,
    required this.location,
    required this.caption,
    required this.likes,
    required this.timestamp,
    required this.colors,
  });

  final String name;
  final String handle;
  final String location;
  final String caption;
  final int likes;
  final String timestamp;
  final List<Color> colors;
}

const List<_Story> _stories = [
  _Story(
    name: 'Your story',
    initials: 'Y',
    colors: [Color(0xFFE1306C), Color(0xFFF77737)],
  ),
  _Story(
    name: 'alice',
    initials: 'A',
    colors: [Color(0xFFFEDA77), Color(0xFFE1306C)],
  ),
  _Story(
    name: 'bob',
    initials: 'B',
    colors: [Color(0xFF405DE6), Color(0xFF833AB4)],
  ),
  _Story(
    name: 'carol',
    initials: 'C',
    colors: [Color(0xFFFD1D1D), Color(0xFFF56040)],
  ),
  _Story(
    name: 'david',
    initials: 'D',
    colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
  ),
];

const List<_Post> _posts = [
  _Post(
    name: 'alice',
    handle: 'alice.studio',
    location: 'San Francisco',
    caption: 'Golden hour caught the city in the best light.',
    likes: 1284,
    timestamp: '2 HOURS AGO',
    colors: [Color(0xFFFDC830), Color(0xFFF37335)],
  ),
  _Post(
    name: 'bob',
    handle: 'bob.codes',
    location: 'Remote',
    caption: 'Another day, another polished Flutter screen.',
    likes: 902,
    timestamp: '5 HOURS AGO',
    colors: [Color(0xFF8360C3), Color(0xFF2EBF91)],
  ),
  _Post(
    name: 'carol',
    handle: 'carol.travels',
    location: 'Lisbon',
    caption: 'Weekend reset. New places always fix my mood.',
    likes: 1730,
    timestamp: '1 DAY AGO',
    colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
  ),
];

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onTap,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

class _StoryChip extends StatelessWidget {
  const _StoryChip({required this.story});

  final _Story story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: story.colors),
            ),
            child: Container(
              width: 62,
              height: 62,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFF2F2F2),
                child: Text(
                  story.initials,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            story.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _InstagramPostCard extends StatelessWidget {
  const _InstagramPostCard({required this.post});

  final _Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFEDEDED)),
          bottom: BorderSide(color: Color(0xFFEDEDED)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFEDA77), Color(0xFFE1306C), Color(0xFF833AB4)],
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black54),
              ),
            ),
            title: Text(
              post.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(post.location),
            trailing: const Icon(Icons.more_horiz),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: AspectRatio(
                aspectRatio: 1,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: post.colors,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromRGBO(0, 0, 0, 0.08),
                            const Color.fromRGBO(0, 0, 0, 0.28),
                          ],
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.photo_camera_rounded,
                        size: 72,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Text(
                        post.handle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send_outlined),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${post.likes.toString()} likes',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, height: 1.35),
                children: [
                  TextSpan(
                    text: '${post.name} ',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: post.caption),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text(
              'View all comments',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              post.timestamp,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
                letterSpacing: 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
