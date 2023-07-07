import 'package:flutter/material.dart';

import '../Model/product.dart';

class ProductDetail extends StatelessWidget {
final Product product;

  const ProductDetail({ Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              )
              ),
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
                 
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 10,),
                    Text(
                      'Rs '+'${product.price}',
                      style: TextStyle(
                        // fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color.fromARGB(255, 197, 5, 14),
                        fontFamily: 'Verdana, Geneva, Tahoma, sans-serif'  , 
                      ),
                    ),
                 ],
                  ),
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
                              fontFamily: 'Verdana, Geneva, Tahoma, sans-serif'  , 
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
                Padding(padding: EdgeInsets.all(8.0)
                ,child: Row( 
                  
                  children:List.generate(5, (index) {
                    return Icon(
                      index < product.rate ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    );
                    
                  }
                  ),
             
                ),
                ),
                Padding(padding: EdgeInsets.only(left:8),
                child: Text('${product.rate} (${product.count})',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                
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
             onPressed: (){},
             child: Text('Add to Cart',style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),),
           )
          )
              ],
              
            ),
            
          ),
               
        ],
        
      ),
    );
  }
}