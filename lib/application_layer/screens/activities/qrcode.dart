import 'package:empiregarage_mobile/services/booking_service/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatefulWidget {
  final int bookingId;

  const QRCodePage({super.key, required this.bookingId});

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  Future<String>? _qrCodeFuture;
  String? _qrCodeData;
  @override
  void initState() {
    super.initState();
    _qrCodeFuture = _getQrCode();
  }

  Future<String>? _getQrCode() async {
    var response = await BookingService().getQrCode(widget.bookingId);
    if (!mounted) return '';
    setState(() {
      _qrCodeData = response;
    });
    return response.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: FutureBuilder(
          future: _qrCodeFuture,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return _qrCodeData != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          QrImage(
                            data: _qrCodeData.toString(),
                            version: QrVersions.auto,
                            size: 200,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _qrCodeData.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )
                    : const Text("QR Code is invalid!");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Text('No Data');
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
