import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/mobel/cart_model.dart';
import 'package:grocery_app/screen/details_page.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/widgets/cardView.dart';
import 'package:grocery_app/widgets/serachingbox.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class MyApp extends StatelessWidget {
  bool isDarkMode = false; // Gece modu durumunu takip etmek için bir değişken
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}

class _HomepageState extends State<Homepage> {
  bool isDarkMode = false; // Gece modu durumunu takip etmek için bir değişken
  // bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: switchValue ? Colors.black : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: switchValue
        //     ? Colors.black
        //     : Colors
        //         .white, // Anahtar değiştirme butonu aktif olduğunda arka plan rengi siyah olacak, değilse beyaz olacak
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Organic Grocery ",
              style: TextStyle(
                color: AppColors.colorsDarkGreen,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.shopping_cart,
              color: AppColors.colorsLiteGreen,
            ),
          ],
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Column(
            children: [
              // SizedBox(height: 15),
              // Text(
              //   "Istanbul, Turkey 🌍 ",
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontWeight: FontWeight.normal,
              //     color: AppColors.colorsLiteBlack,
              //   ),
              // ),
              SizedBox(height: 3), // Boşluk eklendi

              Switch(
                // Anahtarlama (switch) bileşeni kullanarak modu değiştirme
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),

              // Switch(
              //   value: switchValue,
              //   onChanged: (value) {
              //     setState(() {
              //       switchValue = value;
              //     });
              //   },
              //   activeColor: Colors
              //       .green, // Anahtar değiştirme butonunun etkin rengi değiştirildi
              // ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SerachingBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Find Products",
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.colorsGreen,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Let's Order Fresh Items For You",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .black, // Anahtar değiştirme butonu aktif olduğunda yazı rengi siyah, değilse beyaz olacak
                    fontFamily:
                        'NotoSerif', // GoogleFonts kütüphanesi kullanılmadığı için font family doğrudan stil içinde belirtiliyor
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      "images/banner@2x.png",
                    ),
                  ),
                ),
              ),
              Consumer<CatModels>(
                builder: (context, value, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pages(
                                  imagePath: value.shopItems[index][2],
                                  itemName: value.shopItems[index][0],
                                  itemsPrice: value.shopItems[index][1],
                                  color: Colors.black,
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: CardView(index: index),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
