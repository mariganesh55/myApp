import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/product.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final databaseReference = FirebaseDatabase.instance.ref().child("products");

  List<Product> selectedProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
  }

  Future<List<Product>> getData() async {
    // get data from firebase console

    await databaseReference.once().then((var event) {
      if (event.snapshot.value != null) {
        Map response = event.snapshot.value as Map;

        selectedProducts =
            response.values.map((e) => Product.fromJson(e)).toList();
      } else {
        selectedProducts = [];
      }
    });

    return selectedProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart Screen"),
          actions: [
            GestureDetector(
              onTap: () {
                databaseReference.remove();

                setState(() {
                  // getData();
                });
              },
              child: const Icon(Icons.delete),
            )
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: selectedProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final product = selectedProducts[index];
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: Image.network(
                          product.image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )),
                        Text(
                          product.name!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${product.price.toString()}",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
