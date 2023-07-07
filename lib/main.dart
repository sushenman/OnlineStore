import 'package:ecommerce/Provider/provider.dart';
import 'package:ecommerce/Screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const OnlineStore());
}
class OnlineStore extends StatefulWidget {
  const OnlineStore({super.key});

  @override
  State<OnlineStore> createState() => _OnlineStoreState();
}

class _OnlineStoreState extends State<OnlineStore> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}