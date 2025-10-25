import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String
      imageAsset; // Changed from imageUrl to imageAsset
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.imageAsset, // Changed parameter name
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Container(
          height: 180,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment
                    .stretch,
            children: [
              // Image container dengan tinggi tetap
              Container(
                height: 120,
                decoration:
                    BoxDecoration(
                  borderRadius:
                      const BorderRadius
                          .only(
                    topLeft:
                        Radius.circular(
                            8),
                    topRight:
                        Radius.circular(
                            8),
                  ),
                  image:
                      DecorationImage(
                    image: AssetImage(
                        imageAsset), // Changed to AssetImage
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title section
              Padding(
                padding:
                    const EdgeInsets
                        .all(8.0),
                child: Text(
                  title,
                  style:
                      const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow
                      .ellipsis,
                  textAlign:
                      TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
