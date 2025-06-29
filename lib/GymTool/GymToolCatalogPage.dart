import 'package:flutter/material.dart';
import 'package:gym_tool_kit/GymTool/GymToolDetailScreen.dart';

class GymToolsScreen extends StatelessWidget {
  final List<Map<String, String>> tools = [
    {
      'name': 'Dumbbell',
      'image': 'assets/image/dumbbell.jpeg',
      'description': 'Short bars with weights on either side for physical training.',
      'videoUrl': 'https://www.youtube.com/watch?v=U0bhE67HuDY'
    },
    {
      'name': 'Treadmill',
      'image': 'assets/image/treadmill.jpg',
      'description': 'Machine that simulates walking or running indoors.',
      'videoUrl': 'https://www.youtube.com/watch?v=3f8Z0wC4eQo'
    },
    {
      'name': 'Rowing Machine',
      'image': 'assets/image/Rowing Machine.jpg',
      'description': 'Mimics rowing action, great for full body workout.',
      'videoUrl': 'https://www.youtube.com/watch?v=hiwyB7N9ZSQ'
    },
    {
      'name': 'Lat Pulldown',
      'image': 'assets/image/Lat Pulldown.jpg',
      'description': 'Targets the latissimus dorsi muscles.',
      'videoUrl': 'https://www.youtube.com/watch?v=CAwf7n6Luuc'
    },
    {
      'name': 'Cable Machine',
      'image': 'assets/image/Cable Machine.jpg',
      'description': 'Versatile strength training equipment.',
      'videoUrl': 'https://www.youtube.com/watch?v=wUSu2nRS5pI'
    },
    {
      'name': 'Elliptical',
      'image': 'assets/image/Elliptical.jpeg',
      'description': 'Low-impact cardio machine.',
      'videoUrl': 'https://www.youtube.com/watch?v=47tD7aCmD1M'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GymTools'),
        leading: BackButton(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Choose the GymTools',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: tools.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final tool = tools[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GymToolDetailScreen(tool: tool),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(tool['image']!, fit: BoxFit.contain),
                          ),
                          const SizedBox(height: 6),
                          Text(tool['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(
                            tool['description']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
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
}