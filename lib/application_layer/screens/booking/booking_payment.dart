import 'dart:convert';
import 'dart:developer';

import 'package:empiregarage_mobile/models/response/payment_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/booking_fail.dart';

class BookingPayment extends StatefulWidget {
  final Function callback;
  final String url;

  const BookingPayment({Key? key, required this.url, required this.callback})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookingPaymentState createState() => _BookingPaymentState();
}

class _BookingPaymentState extends State<BookingPayment> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            _controller = controller;
          },
          onPageFinished: (String url) async {
            final String json =
                // ignore: deprecated_member_use
                await _controller.evaluateJavascript('document.body.innerText');
            if (isJson(json)) {
              final decoded = jsonDecode(json);
              log(decoded);
              // Process the decoded JSON data here
              try {
                PaymentResponseModel paymentResponseModel =
                    PaymentResponseModel.fromJson(jsonDecode(decoded));
                log(paymentResponseModel.transactionId);
                // ignore: unrelated_type_equality_checks
                if (paymentResponseModel.vnPayResponseCode == "00" &&
                    paymentResponseModel.success == true) {
                  Get.back();
                  widget.callback();
                } else {
                  Get.back();
                  log("Payment failed");
                  Get.bottomSheet(const BookingFailed(
                    message: 'Thanh toán thất bại',
                  ));
                }
              } catch (e) {
                e.toString();
                return;
              }
            }
          },
        ),
      ),
    );
  }
}

bool isJson(String str) {
  try {
    json.decode(str);
    return true;
  } catch (_) {
    return false;
  }
}
