import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  num? height, width;
  String qr = '';
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  openUrl();
                },
                child: Text(
                  qr,
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                )),
            const Spacer(
              flex: 1,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xFF008080)),
                ),
                onPressed: () {
                  qrCode();
                },
                child: const Text('Scanner'),
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  openUrl() {
    String url = qr;
    launch(url);
  }

  Future<void> qrCode() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      ).then((value) {
        setState(() {
          qr = value;
        });
      });

      /// barcode to be used

    } catch (e) {
      setState(() {
        qr = 'Unable';
      });
    }
  }
}
