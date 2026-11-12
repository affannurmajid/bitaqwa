import 'package:flutter/material.dart';
import 'package:bitaqwa/enum/kategori_doa_enum.dart';
import 'package:bitaqwa/data/kategori_doa_ext.dart';
import 'package:bitaqwa/presentation/list_doa_screen.dart';

class DoaDoaPage extends StatelessWidget {
  const DoaDoaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf5fb),
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
        title: const Text(
          'Doa-doa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // SEMUA KONTEN IKUT SCROLL
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          topWidget(),
          menuWidget(context),
        ],
      ),
    );
  }

  // GAMBAR ATAS DAN JAM
  Widget topWidget() {
    final sekarang = DateTime.now();
    final jam = sekarang.hour.toString().padLeft(2, '0');
    final menit = sekarang.minute.toString().padLeft(2, '0');

    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/siang.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '$jam:$menit',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // MENU 6 KATEGORI
  Widget menuWidget(BuildContext context) {
    final categories =DoaCategory.values;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DoaListScreen(category: category),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    category.image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'PoppinsMedium',
                    fontSize: 9,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
