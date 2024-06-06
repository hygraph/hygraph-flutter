import 'package:flutter/material.dart';

class NewsRow extends StatelessWidget {
  const NewsRow({
    super.key,
    required this.preview,
    required this.title,
    required this.url,
  });

  final String preview;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            url,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5.0),
            Text(preview),
            const SizedBox(height: 3.0),
            Text(
              "Tech news",
              style: const TextStyle(fontSize: 11.0),
            ),
          ],
        ),
      ],
    );
  }
}
