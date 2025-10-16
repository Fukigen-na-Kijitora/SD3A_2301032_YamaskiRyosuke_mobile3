import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 画像アセットリスト
final List<Image> imageList = <Image>[
  Image.asset(
    'assets/cat_image.png',
    width: 300.0,
  ),
  Image.asset(
    'assets/dog_image.png',
    width: 300.0,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Image List App",
      home: ImageListPage(),
    );
  }
}

class ImageListPage extends StatelessWidget {
  const ImageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ワンちゃん画像')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageList[0], // 猫の画像
            const SizedBox(height: 20), // 画像の間にスペース
            imageList[1], // 犬の画像
          ],
        ),
      ),
    );
  }
}
