import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/tip_card.dart';
import '../widgets/progress_item.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final List<String> carouselImages = [
    "https://picsum.photos/id/10/400/200",
    "https://picsum.photos/id/20/400/200",
    "https://picsum.photos/id/30/400/200",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEFD5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F6D2D),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.menu, color: Colors.white),
            Text("My application", style: TextStyle(color: Colors.white)),
            Icon(Icons.language, color: Colors.white),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección Test a realizar
              Center(
                child: Column(
                  children: [
                    const Text(
                      "Test a realizar",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: carouselImages.map((imgUrl) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network(imgUrl,
                                  fit: BoxFit.cover, width: double.infinity),
                              Container(
                                color: Colors.black54,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Test de flores nativas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Tips Medioambientales
              const Text(
                "Tips Medioambientales",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 10),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const [
                  TipCard(
                      title: "Como usar menos plástico",
                      imgUrl: "https://picsum.photos/id/40/200"),
                  TipCard(
                      title: "Planta árboles nativos",
                      imgUrl: "https://picsum.photos/id/50/200"),
                  TipCard(
                      title: "Productos ecológicos",
                      imgUrl: "https://picsum.photos/id/60/200"),
                  TipCard(
                      title: "Reduce, Reusa, Recicla",
                      imgUrl: "https://picsum.photos/id/70/200"),
                ],
              ),

              const SizedBox(height: 20),

              // Progreso en los Tests
              const Text(
                "Progreso en los Tests",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: const [
                  ProgressItem(label: "Test de flores", percent: 0.79),
                  ProgressItem(
                      label: "Test de plantas comestibles", percent: 0.50),
                  ProgressItem(label: "Test de fauna", percent: 0.40),
                  ProgressItem(label: "Test de árboles nativos", percent: 0.85),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
