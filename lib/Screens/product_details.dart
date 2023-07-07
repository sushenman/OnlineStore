import 'package:flutter/material.dart';

import '../Model/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  subtitle: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 0.0, right: 0.0),
                        child: Text(
                          'Rs ' + '${product.price}',
                          style: TextStyle(
                            // fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color.fromARGB(255, 197, 5, 14),
                            fontFamily: 'Verdana, Geneva, Tahoma, sans-serif',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(children: [
                    Row(
                      
                      children: List.generate(5, (index) {
                        IconData starIcon;
                        Color starColor;

                        if (index < product.rate.floor()) {
                          starIcon = Icons.star;
                          starColor = Colors.amber;
                        } else if (index < product.rate.ceil()) {
                          starIcon = Icons.star_half;
                          starColor = Colors.amber;
                        } else {
                          starIcon = Icons.star_border;
                          starColor = Colors.grey;
                        }

//The above code is used to display the rating of the product in the product details page using the star icon. The rating is fetched from the API and is displayed in the product details page. 
                        return Icon(
                          starIcon,
                          color: starColor,
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        '${product.rate} (${product.count})',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          '${product.description}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Verdana, Geneva, Tahoma, sans-serif',
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
