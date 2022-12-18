import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context, {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(context: context, builder: (context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 220,
      child: Column(
        children: [
          GestureDetector(
            onTap: onCameraTap,
            child: Card(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: const Text(
                  "Camera",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onGalleryTap,
            child: Card(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}