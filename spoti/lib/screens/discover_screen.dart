import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/album_card.dart';
import '../widgets/now_playing_sheet.dart';
import '../widgets/song_list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 70,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                height: 32,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Ara...',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                    prefixIcon: const Icon(Icons.search, color: Colors.white, size: 18),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategoriler
                  Text(
                    'Kategoriler',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryCard('Pop', Icons.music_note, Colors.blue),
                        _buildCategoryCard('Rock', Icons.music_note_outlined, Colors.red),
                        _buildCategoryCard('Hip Hop', Icons.album, Colors.purple),
                        _buildCategoryCard('Jazz', Icons.piano, Colors.orange),
                        _buildCategoryCard('Klasik', Icons.audiotrack, Colors.green),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Yeni Çıkanlar
                  Text(
                    'Yeni Çıkanlar',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: AlbumCard(
                            title: _getAlbumTitle(index),
                            artist: _getArtistName(index),
                            imageUrl: _getAlbumImage(index),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Önerilen Sanatçılar
                  Text(
                    'Önerilen Sanatçılar',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 128,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[800],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: _getAlbumImage(index),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                _getArtistName(index),
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // En Çok Dinlenenler
                  Text(
                    'En Çok Dinlenenler',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SongListItem(
                        title: _getSongTitle(index),
                        artist: _getArtistName(index),
                        duration: _getSongDuration(index),
                        onTap: () => _showNowPlaying(context, index),
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

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.8),
            color,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getAlbumTitle(int index) {
    final titles = [
      'Gülümse',
      'Müptezhel',
      'Fatih',
      'DarmaDuman',
      'Şivesi Sensin Aşkın',
    ];
    return titles[index];
  }

  String _getArtistName(int index) {
    final artists = [
      'Sezen Aksu',
      'Ezhel',
      'Mabel Matiz',
      'Duman',
      'Yıldız Tilbe',
    ];
    return artists[index];
  }

  String _getAlbumImage(int index) {
    final images = [
      'https://i.scdn.co/image/ab67616100005174921bc8ec2fae6d0b6f8a7834',
      'https://cdn.img.anlatilaninotesi.com.tr/img/07e5/03/0e/1044027236_202:0:665:463_1920x0_80_0_0_f5f33ae33badd3af1b9da1f92c718bda.jpg',
      'https://kaosgl.org/img/galeri/resim/maya-mabelmatiz.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/0/02/Duman_Grubu.jpg',
      'https://image.hurimg.com/i/hurriyet/75/866x494/6752d5f46e7e9ba6d6c268b3.jpg',
    ];
    return images[index];
  }

  String _getSongTitle(int index) {
    final songs = [
      'Gülümse',
      'Müptezhel',
      'Fatih',
      'DarmaDuman',
      'Şivesi Sensin Aşkın',
    ];
    return songs[index];
  }

  String _getSongDuration(int index) {
    final durations = [
      '4:15',
      '3:45',
      '4:30',
      '5:20',
      '3:55',
    ];
    return durations[index];
  }

  void _showNowPlaying(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => NowPlayingSheet(
        title: _getSongTitle(index),
        artist: _getArtistName(index),
        imageUrl: _getAlbumImage(index),
      ),
    );
  }
} 