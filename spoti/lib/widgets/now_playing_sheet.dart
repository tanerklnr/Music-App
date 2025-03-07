import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NowPlayingSheet extends StatelessWidget {
  final String title;
  final String artist;
  final String imageUrl;

  const NowPlayingSheet({
    super.key,
    required this.title,
    required this.artist,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        margin: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: Icon(
                                Icons.music_note,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.music_note,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        artist,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Slider(
                        value: 0.3,
                        onChanged: (value) {},
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey[800],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1:30',
                              style: GoogleFonts.poppins(
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              '4:30',
                              style: GoogleFonts.poppins(
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.shuffle),
                            color: Colors.grey[400],
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_previous),
                            color: Colors.white,
                            iconSize: 32,
                            onPressed: () {},
                          ),
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next),
                            color: Colors.white,
                            iconSize: 32,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.repeat),
                            color: Colors.grey[400],
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.devices),
                            color: Colors.grey[400],
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.playlist_play),
                            color: Colors.grey[400],
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.volume_up),
                            color: Colors.grey[400],
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 