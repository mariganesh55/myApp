import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/product.dart';
import 'package:myapp/utils/cart_screen.dart';

class CartHomeScreen extends StatefulWidget {
  CartHomeScreen({Key? key}) : super(key: key);

  @override
  State<CartHomeScreen> createState() => _CartHomeScreenState();
}

class _CartHomeScreenState extends State<CartHomeScreen> {

  
  final databaseReference = FirebaseDatabase.instance.ref().child("products");
  List<Product> products = List.generate(
      10,
      (index) => Product(
            id: index + 1,
            name: 'Product $index',
            price: index * 10,
            image: 'https://picsum.photos/id/$index/200/300',
          ));

  List<Product> selectedProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            //cart icon with stacked count
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        selectedProducts.length.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
            )
          ],
        ),
        //grid view builder
        body: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
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
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    buttonHeight: 35,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            removeProduct(product);
                          });
                        },
                        child: const Text("remove"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addProduct(product);
                          });

                          setState(() {});
                        },
                        child: const Text("Add"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }

  void addProduct(Product product) {
    if (!selectedProducts.contains(product)) {
      // upload object to firebase console
      databaseReference.push().set(product.toJson());

      // get object list from firebase console
      databaseReference.once().then((var event) {
        Map response = event.snapshot.value as Map;

        selectedProducts =
            response.values.map((e) => Product.fromJson(e)).toList();
      });
    }
  }

  void removeProduct(Product product) {
    if (selectedProducts.contains(product)) {
      selectedProducts.remove(product);
    }
  }

  void clearCart() {
    selectedProducts.clear();
  }

  void createRecord(Product product) {
    databaseReference.child("1").set(product);
  }

  void getData() async {
    await databaseReference.once().then((var event) {
      if (event.snapshot.value != null) {
        Map response = event.snapshot.value as Map;
        selectedProducts =
            response.values.map((e) => Product.fromJson(e)).toList();
      }
    });
  }

  void updateData() {
    databaseReference.child('1').update({'description': 'Ganesh'});
  }

  void deleteData() {
    databaseReference.child('1').remove();
  }
}
