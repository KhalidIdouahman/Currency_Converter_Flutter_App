
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class HomePageCupertino extends StatefulWidget {
  const HomePageCupertino({super.key});

  @override
  State<HomePageCupertino> createState() => _HomePageCupertinoState();
}

class _HomePageCupertinoState extends State<HomePageCupertino> {
  final txtEdtController = TextEditingController();
  double currencyResult = 0;
  final usdToMad = 10.27;

  @override
  Widget build(BuildContext context) {


    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey,
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Currency Converter App"),
        backgroundColor: CupertinoColors.systemGrey,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${currencyResult.toStringAsFixed(2)} DH",
              style: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoTextField(
                controller: txtEdtController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(color: CupertinoColors.black ,  width: 3 )
                ),
                placeholder: "Please enter the amount in USD ",
                placeholderStyle: TextStyle(color: CupertinoColors.black),
                prefix: Icon(CupertinoIcons.money_dollar_circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    currencyResult =
                        double.parse(txtEdtController.text) * usdToMad;
                  });
                },
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: CupertinoColors.black,
                child: const Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}



