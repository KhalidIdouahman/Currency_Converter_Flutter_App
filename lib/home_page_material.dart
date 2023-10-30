import 'package:flutter/material.dart';

// This code it doesn't work form me because i need to display the amount in moroccan dirham , so i need to change
// the state of the screen .

class HomePageMaterial extends StatefulWidget {
  const HomePageMaterial({super.key});

  @override
  State<HomePageMaterial> createState() => _HomePageMaterialState();
}

class _HomePageMaterialState extends State<HomePageMaterial> {
  final txtEdtController = TextEditingController();
  double currencyResult = 0;
  final usdToMad = 10.27;

  @override
  Widget build(BuildContext context) {
    const borderDesign = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Currency Converter App"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currencyResult.toStringAsFixed(2)} DH",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: txtEdtController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Please enter the amount in USD ",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  // border: borderDesign, // this should include these two both but it seems doesn't work .
                  enabledBorder: borderDesign,
                  focusedBorder: borderDesign,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    currencyResult =
                        double.parse(txtEdtController.text) * usdToMad;
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 40)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ),
                child: const Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

