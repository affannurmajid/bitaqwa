
import 'package:flutter/material.dart';
import 'detail_video_kajian.dart';

const Color warnaKajian = Color(0xFFF18F70);
const Color latarKajian = Color(0xFFFAF7FB);

class VideoKajianPage extends StatelessWidget {
  const VideoKajianPage({super.key});

  static const List<Map<String, String>> videos = [
    {
      'id': 'nFr1Jj1KxVk',
      'judul': 'Tujuan Hidup',
      'channel': 'Kajian Singkat',
      'pembicara': 'Ustadz',
      'deskripsi':
          'Hidup bukan sekadar mengejar kesenangan dunia. '
          'Kajian ini mengajak kita merenungkan tujuan hidup, '
          'mengingat bahwa kita diciptakan untuk beribadah kepada '
          'Allah, serta menggunakan waktu untuk melakukan kebaikan.',
    },
    {
      'id': 'AuWmxjV09WY',
      'judul': 'Mengingat Kematian',
      'channel': 'Yufid.TV',
      'pembicara': 'Pemateri dalam video',
      'deskripsi':
          'Mengingat kematian membantu kita menyadari bahwa '
          'kehidupan di dunia tidak berlangsung selamanya. '
          'Jadikan pengingat ini sebagai motivasi untuk memperbaiki '
          'amal, bertaubat, dan mempersiapkan bekal untuk akhirat.',
    },
    {
      'id': 'sX-kePnlgy4',
      'judul': 'Perbaiki Shalatmu',
      'channel': 'Hidayat Official',
      'pembicara': 'Pemateri dalam video',
      'deskripsi':
          'Shalat merupakan ibadah penting dalam kehidupan seorang '
          'Muslim. Kajian ini mengingatkan kita untuk memperbaiki '
          'shalat, menjaga waktunya, dan berusaha menjalankannya '
          'dengan lebih khusyuk serta sungguh-sungguh.',
    },
    {
      'id': '7lYw7cQAleg',
      'judul': 'Takdirmu Adalah Apa yang Kamu Pikirkan',
      'channel': 'Khalid Basalamah Official',
      'pembicara': 'Ustadz Khalid Basalamah',
      'deskripsi':
          'Kajian ini mengajak kita untuk memperhatikan cara '
          'berpikir dan sikap dalam menghadapi kehidupan. '
          'Tetaplah berprasangka baik kepada Allah, berusaha '
          'melakukan hal yang benar, berdoa, dan bertawakal '
          'kepada-Nya dalam menghadapi ketentuan hidup.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latarKajian,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 18, 16),
              decoration: const BoxDecoration(
                color: warnaKajian,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Video Kajian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // BANNER
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFE5D9),
                      Color(0xFFFFF9F5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: const Color(0xFFF5D6C9),
                  ),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.play_circle_fill_rounded,
                        size: 37,
                        color: warnaKajian,
                      ),
                    ),
                    SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Luangkan Waktu untuk Belajar',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF44343A),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Tambah ilmu, perbaiki diri, '
                            'dan ambil hikmah dari setiap kajian.',
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFF75656A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // JUDUL LIST
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 0, 19, 13),
              child: Row(
                children: [
                  const Text(
                    'Pilihan Kajian',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF302A34),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '4 VIDEO',
                      style: TextStyle(
                        color: Color(0xFFB95E43),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // DAFTAR KAJIAN
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      shadowColor: Colors.black.withValues(alpha: 0.07),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailVideoKajianPage(
                                videoId: video['id']!,
                                judul: video['judul']!,
                                channel: video['channel']!,
                                pembicara: video['pembicara']!,
                                deskripsi: video['deskripsi']!,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // THUMBNAIL
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    'https://img.youtube.com/vi/'
                                    '${video['id']}/hqdefault.jpg',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (_, _, _) {
                                      return Container(
                                        color: const Color(0xFFEDE7EE),
                                        child: const Icon(
                                          Icons.video_library_rounded,
                                          size: 55,
                                          color: warnaKajian,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 57,
                                  height: 57,
                                  decoration: BoxDecoration(
                                    color: warnaKajian.withValues(
                                      alpha: 0.96,
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.18,
                                        ),
                                        blurRadius: 12,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 42,
                                  ),
                                ),
                                Positioned(
                                  bottom: 12,
                                  right: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.68,
                                      ),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: const Text(
                                      'PUTAR KAJIAN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // INFORMASI VIDEO
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                15, 14, 15, 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.ondemand_video_rounded,
                                        size: 17,
                                        color: warnaKajian,
                                      ),
                                      const SizedBox(width: 7),
                                      Expanded(
                                        child: Text(
                                          video['channel']!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF938A96),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 9),
                                  Text(
                                    video['judul']!,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      height: 1.35,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF302A34),
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    video['deskripsi']!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      height: 1.6,
                                      color: Color(0xFF766D79),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  const Divider(
                                    height: 1,
                                    color: Color(0xFFF0EAF0),
                                  ),
                                  const SizedBox(height: 12),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Baca penjelasan',
                                        style: TextStyle(
                                          color: warnaKajian,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 17,
                                        color: warnaKajian,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
