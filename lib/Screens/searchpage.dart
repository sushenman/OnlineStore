import 'package:ecommerce/Api/apiservice.dart';
import 'package:ecommerce/Screens/product_details.dart';
import 'package:flutter/material.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  _SearchProductsState createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  ApiService apiService = ApiService();
  TextEditingController searchController = TextEditingController();
  List<dynamic> filteredList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    apiService.callAllProducts();
  }

  void filterProducts(String query) {
    setState(() {
      filteredList = apiService.modelList
          .where((element) =>
              element.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: filterProducts,
              decoration: InputDecoration(
                hintText: 'Search Products',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Card(
                      elevation: 9.0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                product: filteredList[index],
                              ),
                            ),
                          );
                        },
                        leading: Image.network(
                          filteredList[index].image,
                          width: 90,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          filteredList[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '\$${filteredList[index].price.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
