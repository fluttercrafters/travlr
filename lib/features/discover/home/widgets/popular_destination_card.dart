import 'package:flutter/material.dart';

class PopularDestinationCard extends StatelessWidget {
  const PopularDestinationCard({
    super.key,
    required this.destination,
    required this.imageUrl,
  });

  final String destination;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
          width: 120,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  imageUrl,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    destination,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
