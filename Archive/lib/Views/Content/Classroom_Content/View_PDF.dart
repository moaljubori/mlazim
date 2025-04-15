// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class PdfViewr extends StatefulWidget {
  @override
  PdfViewrState createState() => PdfViewrState();

  final String name;
  final String PDF;
  const PdfViewr({Key? key, required this.name, required this.PDF})
      : super(key: key);
}

class PdfViewrState extends State<PdfViewr> {
  @override
  void initState() {
    super.initState();

    // Enable virtual display.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('assets/class_img/read.png', height: 300),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (_) => PDFViewerFromUrl(
                    url: widget.PDF,
                    name: widget.name,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.wifi,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Readfromtheweb'.tr,
                      style: const TextStyle(
                       
                          fontSize: 18,
                          color: Colors.white)),
                ],
              ),
            ),
            padding: const EdgeInsets.only(left: 15, right: 15),
          ),
          Container(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (_) => PDFViewerCachedFromUrl(
                      url: widget.PDF,
                      name: widget.name,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone_android,
                      
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Read through the device'.tr,
                        style: const TextStyle(
                       
                            fontSize: 18,
                          )),
                  ],
                ),
              ),
              padding: const EdgeInsets.only(left: 15, right: 15)),
        ],
      ),
    );
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  final String url;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(
            child: Text(
          '$progress %',
          style: const TextStyle(fontSize: 30),
        )),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class PDFViewerCachedFromUrl extends StatelessWidget {
  const PDFViewerCachedFromUrl({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);

  final String url;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(
            child: Text('$progress %', style: const TextStyle(fontSize: 30))),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
