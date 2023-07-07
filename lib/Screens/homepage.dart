import 'dart:convert';
import 'dart:math';

import 'package:ecommerce/Model/product.dart';
import 'package:ecommerce/Screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> d = {};
  List<dynamic> products = [];
  List<Product> modelList = [];
  String dataencoded = '';
  void initState() {
Future.delayed(Duration(seconds: 5), () {
      callAllProducts();
    });
    super.initState();
  }

  void callAllProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');
    Response response = await get(url);
    List<dynamic> data = jsonDecode(response.body);
    modelList = data.map((item) => Product.fromJson(item)).toList();
   print(response.body);
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    ;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
  child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80"),
                        fit: BoxFit.fitWidth,
                        opacity: 0.4)),
                child: Row(children: [
                  //create a circular avatar
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80'),
                    ),
                  ),

                  Text(
                    'Welcome \n To Online Store ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ])),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
              child: Container(
                child: Text('Just For You', style: TextStyle(fontSize: 20)),
              ),
            ),
            //create a gridview  to display the products and scrollable
           modelList.isNotEmpty? Container(
              height: MediaQuery.of(context).size.height * 0.71,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  itemCount: modelList.length,
                  itemBuilder: (context, index) {
                    return 
                       GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product: modelList[index]))),
                         child: Container(
                          
                          // height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                                             
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          
                          ],
                             color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          
                          child: Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(modelList[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text(modelList[index].title),
                                  Text(
                                    'Rs. ' + modelList[index].price.toString(),
                                    style: TextStyle(color: Color.fromRGBO(4, 4, 4, 1)),

                                  )
                                ],
                              ),
                            ),
                          ),
                                           
                                           ),
                       );
                  }),
            ):Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
