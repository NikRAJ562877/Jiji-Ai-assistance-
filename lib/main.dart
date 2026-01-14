import 'package:flutter/material.dart';

void main() {
  runApp(const JijiApp());
}

class JijiApp extends StatelessWidget {
  const JijiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jiji',
      theme: ThemeData(
        fontFamily: 'SF Pro',
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      ),
      home: const JijiHomeScreen(),
    );
  }
}

class JijiHomeScreen extends StatelessWidget {
  const JijiHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              /// Title
              const Text(
                'Jiji',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your AI Friend',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 0),

/// Stack for Avatar and Search Bar
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/jiji_avatar.png',
                        height: 400,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 0,
                      right: 00,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey, size: 26),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Explain RAG',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: -0.4,
                              child: const Icon(
                                Icons.send,
                                color: Color(0xFF5DA9A8),
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 0),

              /// Response Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jiji says',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Retrieval-Augmented Generation (RAG) combines search with large language models to improve the accuracy of generated answers by providing relevant information from external data sources.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Bullet(text: 'Retrieves data from external sources'),
                    const Bullet(text: 'Uses a language model to generate answers using this data'),
                    const Bullet(text: 'Enhances the accuracy of responses'),
                    
                    const SizedBox(height: 12),
                    
                    /// Resource Cards (Nested)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ResourceTile(
                            icon: Icons.slideshow,
                            title: 'Presentation on RAG',
                            subtitle: 'PowerPoint Presentation',
                            actionText: 'Open',
                            actionColor: const Color(0xFF5DA9A8),
                            iconBgColor: const Color(0xFFFFE8E0),
                          ),
                          const SizedBox(height: 12),
                          ResourceTile(
                            icon: Icons.play_circle_fill,
                            title: 'What is RAG? Retrieval-Augmentd...',
                            subtitle: 'YouTube Video',
                            actionText: 'Watch',
                            actionColor: const Color(0xFF4A90E2),
                            iconBgColor: const Color(0xFFE1F0FF),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  final String text;

  const Bullet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('•  ', style: TextStyle(fontSize: 18, height: 1.2)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String actionText;
  final Color actionColor;
  final Color iconBgColor;

  const ResourceTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.actionColor,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 28, color: actionColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: actionColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minimumSize: const Size(70, 36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              actionText,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}