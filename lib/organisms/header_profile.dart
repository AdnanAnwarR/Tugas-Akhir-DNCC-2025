import 'package:flutter/material.dart';

class HeaderProfile
    extends StatelessWidget {
  final String name;
  final String location;

  const HeaderProfile({
    Key? key,
    required this.name,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius:
            BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration:
                const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                Text(
                  'Halo, $name!',
                  style:
                      const TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                const SizedBox(
                    height: 4),
                Row(
                  children: [
                    const Icon(
                        Icons
                            .location_on,
                        size: 16,
                        color: Colors
                            .grey),
                    const SizedBox(
                        width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                          color: Colors
                              .grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
