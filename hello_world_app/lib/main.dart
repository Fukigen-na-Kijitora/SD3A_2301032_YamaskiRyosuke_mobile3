import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 画像アセットリスト
final List<Image> imageList = <Image>[
  Image.asset('assets/cat_image.png', width: 300.0),
  Image.asset('assets/dog_image.png', width: 200.0),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sample App",
      home: Scaffold(
        appBar: AppBar(title: const Text('Sample Custom Widget App')),
        body: Center(
          child: imageList[0],
        ),
      ),
    );
  }
}
