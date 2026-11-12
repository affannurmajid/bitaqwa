
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

const Color warnaDetailKajian = Color(0xFFF18F70);

class DetailVideoKajianPage extends StatefulWidget {
  final String videoId;
  final String judul;
  final String channel;
  final String pembicara;
  final String deskripsi;

  const DetailVideoKajianPage({
    super.key,
    required this.videoId,
    required this.judul,
    required this.channel,
    required this.pembicara,
    required this.deskripsi,
  });

  @override
  State<DetailVideoKajianPage> createState() =>
      _DetailVideoKajianPageState();
}

class _DetailVideoKajianPageState
    extends State<DetailVideoKajianPage> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  Future<void> bukaYouTube() async {
    final Uri url = Uri.parse(
      'https://www.youtube.com/watch?v=${widget.videoId}',
    );

    final berhasil = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    if (!berhasil && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Video tidak dapat dibuka. Coba lagi nanti.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7FB),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.fromLTRB(8, 9, 18, 15),
              decoration: const BoxDecoration(
                color: warnaDetailKajian,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(22),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.judul,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // ISI DETAIL
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VIDEO PLAYER
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: YoutubePlayer(
                        controller: _controller,
                        aspectRatio: 16 / 9,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20, 22, 20, 28,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // INFORMASI CHANNEL
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.06,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.menu_book_rounded,
                                  color: warnaDetailKajian,
                                  size: 27,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.channel,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF827984),
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      widget.pembicara,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Color(0xFF302A34),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // JUDUL
                          Text(
                            widget.judul,
                            style: const TextStyle(
                              fontSize: 24,
                              height: 1.3,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF302A34),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // JUDUL DESKRIPSI
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: warnaDetailKajian,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Tentang Kajian',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF302A34),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 13),

                          // DESKRIPSI VIDEO
                          Text(
                            widget.deskripsi,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.9,
                              color: Color(0xFF655D68),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // KOTAK PENGINGAT
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(17),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE9DF),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFF7D5C7),
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.lightbulb_outline_rounded,
                                  color: warnaDetailKajian,
                                  size: 27,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Catatan Kebaikan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xFF493D48),
                                        ),
                                      ),
                                      SizedBox(height: 7),
                                      Text(
                                        'Jangan berhenti pada menonton '
                                        'kajian saja. Ambil pelajaran '
                                        'yang bermanfaat dan usahakan '
                                        'untuk mengamalkannya dalam '
                                        'kehidupan sehari-hari.',
                                        style: TextStyle(
                                          fontSize: 12,
                                          height: 1.8,
                                          color: Color(0xFF665963),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 22),

                          // TOMBOL BUKA YOUTUBE
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: bukaYouTube,
                              icon: const Icon(
                                Icons.open_in_new_rounded,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Buka di YouTube',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: warnaDetailKajian,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
