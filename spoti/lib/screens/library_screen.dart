import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/album_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text(
              'Kütüphane',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Çalma Listeleri',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final playlistTitles = [
                          'En Sevdiğim Türkçe Şarkılar',
                          'Rock Klasikleri',
                          'Pop Şarkıları',
                          'Arabesk',
                          'Rap Şarkıları',
                        ];
                        final playlistImages = [
                          'https://www.rapertuar.com/wp-content/uploads/2021/12/s%CC%A7ehins%CC%A7ah-1-1080x680.jpg',
                          'https://cdn.wannart.com/production/post/2018/04/jimi-hendrix-live-1967-billboard-1548.jpg',
                          'https://www.sozmuzik.com/wp-content/uploads/2023/07/semicenk1-640x640.jpg',
                          'https://temteknoloji.com.tr/wp-content/uploads/2024/11/muslum-gurses.webp',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPerP0-I8kTeEICJU5j9Bso31OJe6oHOP4UQ&s',
                        ];
                        return Container(
                          width: 170,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: playlistImages[index],
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[700],
                                    child: const Icon(
                                      Icons.music_note,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    color: Colors.grey[700],
                                    child: const Icon(
                                      Icons.music_note,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      playlistTitles[index],
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${(index + 1) * 10} şarkı',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Albümler',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final albumTitles = [
                        'Gülümse',
                        'Müptezhel',
                        'Fatih',
                        'DarmaDuman',
                        'Şivesi Sensin Aşkın',
                        'Orman Kanunları',
                      ];
                      final albumArtists = [
                        'Sezen Aksu',
                        'Ezhel',
                        'Mabel Matiz',
                        'Duman',
                        'Yıldız Tilbe',
                        'Ben Fero',
                      ];
                      final albumImages = [
                        'https://i.scdn.co/image/ab67616100005174921bc8ec2fae6d0b6f8a7834',
                        'https://cdn.img.anlatilaninotesi.com.tr/img/07e5/03/0e/1044027236_202:0:665:463_1920x0_80_0_0_f5f33ae33badd3af1b9da1f92c718bda.jpg',
                        'https://kaosgl.org/img/galeri/resim/maya-mabelmatiz.jpg',
                        'https://upload.wikimedia.org/wikipedia/commons/0/02/Duman_Grubu.jpg',
                        'https://image.hurimg.com/i/hurriyet/75/866x494/6752d5f46e7e9ba6d6c268b3.jpg',
                        'https://cdn-images.dzcdn.net/images/artist/cd7de0ac70198ea395e8c43fac6200cd/1900x1900-000000-80-0-0.jpg',
                      ];
                      return AlbumCard(
                        title: albumTitles[index],
                        artist: albumArtists[index],
                        imageUrl: albumImages[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 