import 'package:flutter/material.dart';
import 'package:bitaqwa/enum/kategori_doa_enum.dart';
import 'package:bitaqwa/data/kategori_doa_ext.dart';
import 'package:bitaqwa/data/doa_data.dart';
import 'package:bitaqwa/presentation/detail_doa_screen.dart';

class DoaListScreen extends StatelessWidget {
  final DoaCategory category;

  const DoaListScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final doaList = doaData[category] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xfffaf5fb),

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xfff18f70),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // DAFTAR DOA
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        itemCount: doaList.length,
        itemBuilder: (context, index) {
          final doa = doaList[index];

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),

              // BUKA DETAIL DOA
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailDoaScreen(
                      judul: doa.title,
                      doaArab: doa.arabicText,
                      arti: doa.translation,
                      reference: doa.reference,
                    ),
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // GAMBAR DOA SESUAI DATA
                    Image.asset(
                      doa.image,
                      width: 48,
                      height: 48,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(width: 12),

                    // JUDUL DOA
                    Expanded(
                      child: Text(
                        doa.title,
                        style: const TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // ICON PANAH
                    const Icon(
                      Icons.chevron_right,
                      color: Color(0xfff18f70),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
