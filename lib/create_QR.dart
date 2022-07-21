import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CreateScanner extends StatefulWidget {
  const CreateScanner({Key? key}) : super(key: key);

  @override
  State<CreateScanner> createState() => _CreateScannerState();
}

class _CreateScannerState extends State<CreateScanner> {
  String create = 'Add Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Create'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BarcodeWidget(
            data: create,
            barcode: Barcode.qrCode(),
            color: Colors.black,
            width: 200,
            height: 200,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .8,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  create = value;
                });
              },
              decoration: const InputDecoration(
                  hintText: 'Enter Here',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ))),
            ),
          ),
          MaterialButton(
            onPressed: () {
              saveImage();
            },
            color: const Color(0xFF008080),
            child: const Text(
              'Save Png',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }

  void saveImage() async {
    await GallerySaver.saveImage(create, toDcim: true);
  }
}
