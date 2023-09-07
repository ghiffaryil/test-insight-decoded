import 'package:flutter/material.dart';
import 'package:test_flutter_id/model/api_services.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ApiServices apiService = ApiServices();
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final productList = await apiService.getProducts();
      setState(() {
        products = productList;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Product List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Image.network(
                          product['image'],
                          width: 200,
                          // fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['category'],
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(product['title']),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$ ${product['price']}',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            );
            // return ListTile(

            //   title: Text(product['title']),
            //   subtitle: Text('\$${product['price']}'),
            //   // Add more widgets to display additional product information
            // );
          },
        ),
      ),
    );
  }
}
