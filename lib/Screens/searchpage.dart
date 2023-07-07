import 'package:ecommerce/Api/apiservice.dart';
import 'package:ecommerce/Screens/product_details.dart';
import 'package:flutter/material.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  ApiService apiService = ApiService();
  TextEditingController searchController = TextEditingController();
List<dynamic> dupiList = [];
  void initState(){
   Future.delayed(Duration(seconds: 2), () {
     fetchData();
    });
    super.initState();
  }
    fetchData() {
  
        apiService.callAllProducts(); 
      //  print(apiService.modelList);
       
      // print(apiService.modelList.length);
      // print(apiService.modelList[0].title);
      
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Products'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search Products',
                  suffixIcon: IconButton(
                    onPressed: () {
                  
                     setState(() {
  try {
    // apiService.modelList = apiService.modelList
    //     .where((element) =>
    //         element.title.toLowerCase().contains(searchController.text.toLowerCase()))
    //     .toList();
    dupiList = apiService.modelList.where((element) =>  element.title.toLowerCase().contains(searchController.text.toLowerCase())).toList();
  } catch (e) {
    // Handle the exception here
    print('An exception occurred: $e');
    // Perform any necessary error handling or display an error message
  }
});


                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dupiList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            product: dupiList[index],
                          ),
                        ),
                      );
                    },
                    leading: Image.network(dupiList[index].image),
                    title: Text(dupiList[index].title),
                    subtitle: Text(dupiList[index].description),
                    trailing: Text(dupiList[index].price.toString()),
                  );
                },
              ),
                 ),
          ],
        ),
        // child: Column(
        //   children: [
       
        //     ),
        //   ],
        // ),
      ),
    );
  }
  

}