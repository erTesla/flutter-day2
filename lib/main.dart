import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainNavigation(),
    );
  }
}


class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});


  @override
  State<MainNavigation> createState() => _MainNavigationState();
}


class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            activeIcon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }


  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const FeedScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const ReelsScreen();
      case 3:
        return const LikesScreen();
      case 4:
        return const MessagesScreenWidget();
      case 5:
        return const ProfileScreen();
      default:
        return const FeedScreen();
    }
  }
}


// ============================================================================
// FEED SCREEN
// ============================================================================
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});


  @override
  State<FeedScreen> createState() => _FeedScreenState();
}


class _FeedScreenState extends State<FeedScreen> {
  final List<Post> posts = [
    Post(
      username: 'john_doe',
      userImage: '👤',
      postImage: '📸',
      location: 'New York, USA',
      caption: 'Beautiful sunset at Central Park! 🌅',
      likes: 1234,
      isLiked: false,
    ),
    Post(
      username: 'jane_smith',
      userImage: '👩',
      postImage: '🏖️',
      location: 'Bali, Indonesia',
      caption: 'Paradise found! 🌴',
      likes: 2456,
      isLiked: false,
    ),
    Post(
      username: 'travel_buddy',
      userImage: '🧑',
      postImage: '⛰️',
      location: 'Swiss Alps',
      caption: 'Mountain life is the best life! 🏔️',
      likes: 3789,
      isLiked: false,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            icon: const Icon(Icons.favorite_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildStoriesSection(),
          const Divider(height: 1),
          ..._buildPostsList(),
        ],
      ),
    );
  }


  Widget _buildStoriesSection() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.orange],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    border: Border.all(
                      color: Colors.pink,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      index == 0 ? '+' : '👤',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  index == 0 ? 'Your Story' : 'user_$index',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        },
      ),
    );
  }


  List<Widget> _buildPostsList() {
    return posts.asMap().entries.map((entry) {
      int index = entry.key;
      Post post = entry.value;
      return _buildPostCard(post, index);
    }).toList();
  }


  Widget _buildPostCard(Post post, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                  ),
                ),
                child: Center(
                  child: Text(post.userImage, style: const TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      post.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey[200],
          child: Center(
            child: Text(
              post.postImage,
              style: const TextStyle(fontSize: 80),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  posts[index].isLiked ? Icons.favorite : Icons.favorite_outline,
                  color: posts[index].isLiked ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    posts[index].isLiked = !posts[index].isLiked;
                    posts[index].likes += posts[index].isLiked ? 1 : -1;
                  });
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.comment_outlined, color: Colors.black),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              IconButton(
                icon: const Icon(Icons.share_outlined, color: Colors.black),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_outline, color: Colors.black),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${post.likes} likes',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${post.username} ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: post.caption,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: GestureDetector(
            onTap: () {},
            child: Text(
              'View all comments',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            '2 hours ago',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
        ),
        const Divider(height: 16),
      ],
    );
  }
}


class Post {
  final String username;
  final String userImage;
  final String postImage;
  final String location;
  final String caption;
  int likes;
  bool isLiked;


  Post({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.location,
    required this.caption,
    required this.likes,
    required this.isLiked,
  });
}


// ============================================================================
// SEARCH SCREEN
// ============================================================================
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});


  @override
  State<SearchScreen> createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: true,
            pinned: false,
            backgroundColor: Colors.white,
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search users, posts...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(2),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final emojis = [
                    '📸', '🏖️', '⛰️', '🌅', '🎨', '🍕',
                    '🎭', '🌊', '🏔️', '🎪', '🌴', '🎸',
                    '🚀', '🏝️', '🎡', '🌺', '🦋', '🌻',
                    '🎨', '🖼️', '🎭', '🎪', '🎯', '🎲',
                  ];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          emojis[index],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ============================================================================
// REELS SCREEN
// ============================================================================
class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});


  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}


class _ReelsScreenState extends State<ReelsScreen> {
  final List<Reel> reels = [
    Reel(
      username: 'john_doe',
      userImage: '👤',
      reelEmoji: '📸',
      title: 'Amazing Photography Tips',
      likes: 5432,
      comments: 234,
    ),
    Reel(
      username: 'jane_travel',
      userImage: '👩',
      reelEmoji: '🏖️',
      title: 'Paradise Found',
      likes: 8923,
      comments: 567,
    ),
    Reel(
      username: 'adventure_seeker',
      userImage: '🧑',
      reelEmoji: '⛰️',
      title: 'Mountain Climbing Adventure',
      likes: 6789,
      comments: 345,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          'Reels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _buildReelPage(reels[index]);
        },
      ),
    );
  }


  Widget _buildReelPage(Reel reel) {
    return Stack(
      children: [
        Container(
          color: Colors.grey[800],
          child: Center(
            child: Text(
              reel.reelEmoji,
              style: const TextStyle(fontSize: 120),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Colors.pink, Colors.orange],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                reel.userImage,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reel.username,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        reel.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildActionButton(
                      icon: Icons.favorite_outline,
                      label: _formatNumber(reel.likes),
                    ),
                    const SizedBox(height: 20),
                    _buildActionButton(
                      icon: Icons.comment_outlined,
                      label: _formatNumber(reel.comments),
                    ),
                    const SizedBox(height: 20),
                    _buildActionButton(
                      icon: Icons.share_outlined,
                      label: 'Share',
                    ),
                    const SizedBox(height: 20),
                    _buildActionButton(
                      icon: Icons.more_vert,
                      label: '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Center(
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.white,
            size: 60,
          ),
        ),
      ],
    );
  }


  Widget _buildActionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          ),
      ],
    );
  }


  String _formatNumber(int num) {
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(1)}M';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    }
    return num.toString();
  }
}


class Reel {
  final String username;
  final String userImage;
  final String reelEmoji;
  final String title;
  final int likes;
  final int comments;


  Reel({
    required this.username,
    required this.userImage,
    required this.reelEmoji,
    required this.title,
    required this.likes,
    required this.comments,
  });
}


// ============================================================================
// LIKES SCREEN
// ============================================================================
class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final likedPosts = [
      LikedPost(
        username: 'john_doe',
        userImage: '👤',
        postImage: '📸',
        timestamp: '2 hours ago',
        likedBy: 'You liked john_doe\'s post',
      ),
      LikedPost(
        username: 'jane_smith',
        userImage: '👩',
        postImage: '🏖️',
        timestamp: '5 hours ago',
        likedBy: 'You liked jane_smith\'s post',
      ),
      LikedPost(
        username: 'travel_buddy',
        userImage: '🧑',
        postImage: '⛰️',
        timestamp: '1 day ago',
        likedBy: 'You liked travel_buddy\'s post',
      ),
      LikedPost(
        username: 'sarah_photos',
        userImage: '👸',
        postImage: '🌅',
        timestamp: '2 days ago',
        likedBy: 'You liked sarah_photos\'s post',
      ),
      LikedPost(
        username: 'mike_adventure',
        userImage: '🧔',
        postImage: '🎨',
        timestamp: '3 days ago',
        likedBy: 'You liked mike_adventure\'s post',
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Activity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: likedPosts.length,
        itemBuilder: (context, index) {
          return _buildLikeActivityItem(likedPosts[index]);
        },
      ),
    );
  }


  Widget _buildLikeActivityItem(LikedPost post) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                  ),
                ),
                child: Center(
                  child: Text(
                    post.userImage,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: post.username,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: ' liked your post',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      post.timestamp,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    post.postImage,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add, size: 20),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}


class LikedPost {
  final String username;
  final String userImage;
  final String postImage;
  final String timestamp;
  final String likedBy;


  LikedPost({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.timestamp,
    required this.likedBy,
  });
}


// ============================================================================
// MESSAGES SCREEN
// ============================================================================
class MessagesScreenWidget extends StatefulWidget {
  const MessagesScreenWidget({super.key});


  @override
  State<MessagesScreenWidget> createState() => _MessagesScreenWidgetState();
}


class _MessagesScreenWidgetState extends State<MessagesScreenWidget> {
  final List<Message> messages = [
    Message(
      username: 'john_doe',
      userImage: '👤',
      lastMessage: 'That sounds great! 👍',
      timestamp: '2:45 PM',
      unreadCount: 0,
    ),
    Message(
      username: 'jane_smith',
      userImage: '👩',
      lastMessage: 'Check out this amazing place!',
      timestamp: 'Yesterday',
      unreadCount: 3,
    ),
    Message(
      username: 'alex_travel',
      userImage: '🧑',
      lastMessage: 'Can you help me with that?',
      timestamp: '10:30 AM',
      unreadCount: 0,
    ),
    Message(
      username: 'sarah_photos',
      userImage: '👸',
      lastMessage: 'Love your latest post! 📸',
      timestamp: 'Monday',
      unreadCount: 1,
    ),
    Message(
      username: 'mike_adventure',
      userImage: '🧔',
      lastMessage: 'Let\'s plan another trip',
      timestamp: 'Sunday',
      unreadCount: 0,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Direct Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return _buildMessageTile(msg);
        },
      ),
    );
  }


  Widget _buildMessageTile(Message message) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.orange],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      message.userImage,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                if (message.unreadCount > 0)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          message.unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        message.timestamp,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.lastMessage,
                    style: TextStyle(
                      color: message.unreadCount > 0
                          ? Colors.black
                          : Colors.grey[600],
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: message.unreadCount > 0
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Message {
  final String username;
  final String userImage;
  final String lastMessage;
  final String timestamp;
  final int unreadCount;


  Message({
    required this.username,
    required this.userImage,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
  });
}


// ============================================================================
// PROFILE SCREEN
// ============================================================================
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'your_profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.pink, Colors.orange],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '👤',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatItem('45', 'Posts'),
                            _buildStatItem('1.2K', 'Followers'),
                            _buildStatItem('234', 'Following'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Flutter Developer | Photography Enthusiast 📸',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'www.yourwebsite.com',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildHighlight('Travel'),
                  _buildHighlight('Food'),
                  _buildHighlight('Art'),
                  _buildHighlight('Music'),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(2),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(
                        ['📸', '🏖️', '⛰️', '🌅', '🎨', '🍕',
                              '🎭', '🌊', '🏔️', '🎪', '🌴', '🎸'][index],
                        style: const TextStyle(fontSize: 40),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }


  Widget _buildHighlight(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}



