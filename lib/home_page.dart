import 'package:flutter/material.dart';
import 'package:gym_tool_kit/AccountPage.dart';
import 'package:gym_tool_kit/GymTool/GymToolCatalogPage.dart';
import 'package:gym_tool_kit/GymTool/GymToolDetailScreen.dart';
import 'custom_bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages to show on bottom nav tap
  final List<Widget> _pages = [
    const HomeContent(),
    GymToolsScreen(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile avatar tappable to open account page
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountPage()),
                  );
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/image/image.jpg'),
                ),
              ),

              const SizedBox(height: 10),

              // Greeting text
              const Text(
                'Hello, Remon',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Welcome message
              const Text(
                'Welcome to GymToolKit! Together, we will achieve fitness success. Get started!',
                style: TextStyle(fontSize: 11),
              ),

              const SizedBox(height: 10),

              // Horizontal scroll of promo cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCard('assets/image/fitness carousel 1.png'),
                    _buildCard('assets/image/Gym_Yoga_wallpapers-compressed-page-008_800x.webp'),
                    _buildCard('assets/image/images.jpeg'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search input field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.deepPurple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Recommended gym tools preview
              GymToolPreviewSection(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build carousel cards
  Widget _buildCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 180,
          width: 293,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class GymToolPreviewSection extends StatelessWidget {
  final List<Map<String, String>> tools = [
    {
      'name': 'Dumbbell',
      'image': 'assets/image/dumbbell.jpeg',
      'description': 'Short bars with weights on either side for training.',
      'videoUrl': 'https://www.youtube.com/watch?v=U0bhE67HuDY'
    },
    {
      'name': 'Treadmill',
      'image': 'assets/image/treadmill.jpg',
      'description': 'Simulates walking or running indoors.',
      'videoUrl': 'https://www.youtube.com/watch?v=3f8Z0wC4eQo'
    },
    {
      'name': 'Rowing Machine',
      'image': 'assets/image/Rowing Machine.jpg',
      'description': 'Mimics rowing for full body workout.',
      'videoUrl': 'https://www.youtube.com/watch?v=hiwyB7N9ZSQ'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Gym Tools",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GymToolsScreen()),
                  );
                },
                child: const Text(
                  "see all",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tools.length,
            itemBuilder: (context, index) {
              final tool = tools[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GymToolDetailScreen(tool: tool)),
                  );
                },

                child: Container(
                  width: 140,
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          tool['image']!,
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tool['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(
                              tool['description']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
