import 'package:flutter/material.dart';
import 'package:flutter_product_carousel/flutter_product_carousel.dart';

final  List<Map<String, String>> offers = [
  {
    'image': "assets/offer1.jpg",
    'des': "Buy 1 get 1 free on selected accessories.",
  },
  {
    'image': "assets/offer2.jpg",
    'des': "Exclusive student discount - Save 20% more!",
  },
  {'image': "assets/offer3.jpg", 'des': "Mega combo deals for gaming lovers!"},
  {
    'image': "assets/offer4.jpg",
    'des': "Free shipping on all orders above \$50.",
  },
  {
    'image': "assets/offer5.jpg",
    'des': "Get 50% off on all electronics this weekend only!",
  },
];

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});
  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final ProductCarouselController _controller = ProductCarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "   Our Products",
          style: TextStyle(
            color: Color.fromARGB(255, 64, 83, 225),
            fontFamily: "Suwannaphum-Regular",
            fontWeight: FontWeight.bold,
            fontSize: 29.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Text(
            "               Featured Products",
            style: TextStyle(
              color: Color.fromARGB(255, 17, 13, 18),
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 350,
            child: PageView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),

                  child: ProductCarousel(
                    imagesList: const [
                      'assets/Fet1.jpg',
                      'assets/Fet2.jpg',
                      'assets/featured1.jpg',
                    ],
                    carouselOptions: ProductCarouselOptions(
                      autoPlay: false,
                      aspectRatio: 15 / 9,
                      showNavigationIcons: true,
                      enabledInfiniteScroll: true,
                      productCarouselController: _controller,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "              Shop Our Collection",
            style: TextStyle(
              color: Color.fromARGB(255, 17, 13, 18),
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildProductCard(
                  'assets/mouse1.jpg',
                  'Gaming Wireless Mouse',
                  '\$100',
                ),
                buildProductCard(
                  'assets/headphone.jpg',
                  'Wireless Headphones',
                  '\$299',
                ),
                buildProductCard(
                  'assets/keyboard1.jpg',
                  'Gaming Keboard',
                  '\$150',
                ),
                buildProductCard('assets/mousepad.jpg', 'Mousepad', '\$50'),
                buildProductCard('assets/xbox.jpg', "Xbox", '\$499'),
                buildProductCard(
                  'assets/graphic_card.jpg',
                  'Graphic Card',
                  '\$999',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "                   Hot Offers 🔥",
            style: TextStyle(
              color: Color.fromARGB(255, 17, 13, 18),
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
            
                    ListView.builder(
                      itemCount: offers.length,
                      scrollDirection: Axis.vertical,
                       shrinkWrap: true, 
                        physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                )
                              ]
                            ),
                            child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          offers[index]["image"]! ,
                          width: 80,
                          height: 80,
                          cacheWidth: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          offers[index]["des"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Suwannaphum-Regular",
                          ),
                        ),
                      ) 
                    ]
                          ),
                          )
                        );
                      },
                    ),
                    

        ],
      ),
    );
  }
}

Widget buildProductCard(String imagePath, String title, String price) {
  return Builder(
    builder: (context) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Suwannaphum-Regular",
                    ),
                  ),

                  Text(
                    price,
                    style: TextStyle(
                      color: Color.fromARGB(255, 64, 83, 225),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Suwannaphum-Regular",
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color.fromARGB(255, 64, 83, 225),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Item added to the cart"),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  ),
                
                  
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
