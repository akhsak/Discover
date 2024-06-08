import 'package:discover/controller/bottom.dart';
import 'package:discover/model/admin_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget popularPackageCard(
    BuildContext context, String title, String imagePath) {
  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget expandedTripCard(BuildContext context, {AdminModel? trip}) {
  if (trip == null) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: const Center(
        child: Text(
          'No trip data available',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  final bottomProvider = Provider.of<BottomProvider>(context);
  final imageUrl =
      (trip.image != null && trip.image!.isNotEmpty) ? trip.image![0] : null;

  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  trip.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: double.infinity,
                      height: 120,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              )
            else
              Container(
                width: double.infinity,
                height: 120,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Text(
                    'No Image Available',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    bottomProvider.onTap(0);
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          trip.placeName!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Lorem ipsum dolor sit amet.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
