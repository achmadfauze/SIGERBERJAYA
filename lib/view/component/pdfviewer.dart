import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class PdfView extends StatefulWidget {
  @override
  _Pdf createState() => _Pdf();
}

class _Pdf extends State<PdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Koronavirus'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://covid19.go.id/storage/app/media/Regulasi/2021/November/revisi-se-ka-satgas-nomor-23-tahun-2021-tentang-protokol-kesehatan-perjalanan-internasional-pada-masa-pandemi-corona-virus-disease-2019-covid-19.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

// class PdfView extends StatefulWidget {
//   const PdfView({Key? key}) : super(key: key);

//   @override
//   State<PdfView> createState() => _PdfViewState();
// }

// class _PdfViewState extends State<PdfView> {
//   bool _isLoading = true;
//   late PDFDocument _pdf;

//   void _loadFile() async {
//     // Load the pdf file from the internet
//     PDFDocument _pdf = await PDFDocument.fromAsset('assets/test.pdf');
//     // _pdf = await PDFDocument.fromURL(
//     //     // 'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf');
//     //     'https://pajak.go.id/sites/default/files/2020-04/PER-06PJ2020.pdf');

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadFile();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: _isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : PDFViewer(document: _pdf)),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

// class PdfView extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<PdfView> {
//   bool _isLoading = true;
//   late PDFDocument document;

//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }

//   loadDocument() async {
//     document = await PDFDocument.fromAsset('assets/test.pdf');
//     // document = await PDFDocument.fromAsset('assets/sample.pdf');

//     setState(() => _isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : PDFViewer(document: document),
//         // child: _isLoading
//         //     ? Center(child: CircularProgressIndicator())
//         //     : PDFViewer(
//         //         document: document,
//         //         zoomSteps: 1,
//         //       ),
//       ),
//     );
//   }
// }
