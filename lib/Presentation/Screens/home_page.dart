import 'package:flutter/material.dart';
import '../../Data/Local_Storage/secure_storage.dart';
import '../Components/primary_btn.dart';
import '../Components/spacer.dart';
import '../Declarations/constants.dart';

import '../Components/app_bar.dart';
import '../Components/text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController textEditingController;
  String _storeValue = '';

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(appBarTitle: widget.title),
      body: Center(
        child: Padding(
          padding: kPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.security, color: primaryColor, size: 100),
              HeightSpacer(myHeight: kSpacing),
              Text('Storing data securely using Flutter Secure Storage',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: kfontSize)),
              HeightSpacer(myHeight: kSpacing * 2),
              TextFormFieldBldr(textEditingController: textEditingController),
              HeightSpacer(myHeight: kSpacing * 2),
              PrimaryBtn(
                btnText: 'Store Data',
                btnFun: () {
                  SecureStorage()
                      .writeSecureData('name', textEditingController.text);
                  _storeValue = 'Data saved!';
                  textEditingController.clear();
                  setState(() {});
                },
              ),
              HeightSpacer(myHeight: kSpacing * 2),
              PrimaryBtn(
                  btnText: 'Read Data',
                  btnFun: () async {
                    _storeValue = await SecureStorage().readSecureData('name');
                    setState(() {});
                  }),
              HeightSpacer(myHeight: kSpacing * 2),
              PrimaryBtn(
                btnText: 'Delete Data',
                btnFun: () {
                  SecureStorage().deleteSecureData('name');
                  _storeValue = 'No data found!';
                  setState(() {});
                },
              ),
              HeightSpacer(myHeight: kSpacing * 3),
              Text(_storeValue),
            ],
          ),
        ),
      ),
    );
  }
}
