import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyek Sesi 4',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> posters = const [
    'assets/images/poster1.png',
    'assets/images/poster2.png',
    'assets/images/poster3.png',
    'assets/images/poster4.png',
    'assets/images/poster5.png',
    'assets/images/poster6.png',
  ];

  Widget section(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.only(right: 12),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(items[index], fit: BoxFit.cover, width: double.infinity),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Movie ${index+1}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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

  @override
  Widget build(BuildContext context) {
    final List<String> nowPlaying = posters;
    final List<String> trending = posters.reversed.toList();
    final List<String> popular = posters;
    final List<String> topRated = posters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise - Proyek Sesi 4'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Now Playing carousel
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 280,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  autoPlay: true,
                ),
                items: nowPlaying.map((path) {
                  return Builder(builder: (context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.asset(path, fit: BoxFit.cover, width: double.infinity, height: 280),
                          Positioned(
                            left: 12,
                            bottom: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              color: Colors.black54,
                              child: const Text('Now Playing', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                }).toList(),
              ),
            ),

            // Sections
            section('Trending', trending),
            section('Popular', popular),
            section('Top Rated', topRated),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}