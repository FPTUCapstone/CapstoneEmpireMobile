import 'package:easy_stepper/easy_stepper.dart';
import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_payment_service.dart';
import 'package:empiregarage_mobile/application_layer/on_going_service/on_going_service_body.dart';
import 'package:empiregarage_mobile/application_layer/on_going_service/recommend_chose_service.dart';
import 'package:empiregarage_mobile/application_layer/on_going_service/on_doing_service.dart';
import 'package:empiregarage_mobile/application_layer/widgets/loading.dart';
import 'package:empiregarage_mobile/application_layer/widgets/on_going_service_progress_bar.dart';
import 'package:empiregarage_mobile/services/order_services/order_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/colors.dart';
import '../../models/response/orderservices.dart';

class Status {
  final int id;
  final String text;

  Status(this.id, this.text);
}

class OnGoingService extends StatefulWidget {
  final int servicesId;
  const OnGoingService({
    super.key,
    required this.servicesId,
  });

  @override
  State<OnGoingService> createState() => _OnGoingServiceState();
}

List<Step> stepList() => [
      const Step(title: Text("123123123"), content: Text("ABXC1")),
      const Step(title: Text("123123123"), content: Text("ABXC2")),
    ];

class _OnGoingServiceState extends State<OnGoingService> {
  late OrderServicesResponseModel? _response;
  int activeStep = 0;
  bool _loading = true;
  int _selectedTab = 0;
  List<dynamic> _tabs = [];

  _getOrderServices() async {
    var orderResponseModel =
        await OrderServices().getOrderServicesById(widget.servicesId);
    if (orderResponseModel == null) {
      throw Exception("Error when load order");
    }
    _tabs = [
      OnGoingServiceBody(order: orderResponseModel),
      OnGoingServiceBody(order: orderResponseModel),
      RecommendChoseService(
        onRecommendChoseServicecallBack: _onRecommendChoseServicecallBack,
      ),
      const OnDoingService(),
      const OnDoingService()
    ];
    if (!mounted) return;
    setState(() {
      _response = orderResponseModel;
      _loading = false;
    });
  }

  @override
  void initState() {
    _getOrderServices();
    super.initState();
  }

  _onCallBack(selectedTab) {
    setState(() {
      _selectedTab = selectedTab;
    });
  }

  _onRecommendChoseServicecallBack() {
    setState(() {
      _tabs[2] = OnGoingPaymentService(
          onGoingPaymentCallBack: _onGoingPaymentCallBack);
    });
  }

  _onGoingPaymentCallBack() {
    setState(() {
      _tabs[2] = RecommendChoseService(
        onRecommendChoseServicecallBack: _onRecommendChoseServicecallBack,
      );
    });
  }

  List<Status> statuses = [
    Status(0, "Đang phân tích"),
    Status(1, "Xác nhận & thanh toán"),
    Status(2, "Đang thực hiện"),
    Status(3, "Đợi lấy xe"),
    Status(4, "Hoàn thành"),
    Status(-1, "Đã hủy"),
  ];

  _getStatus(int id) {
    return statuses.where((element) => element.id == id).first.text;
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.lightGrey,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  FontAwesomeIcons.chevronDown,
                  color: AppColors.grey600,
                ),
              ),
              title: Text(
                _getStatus(_response!.status),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  OnGoingServiceProgressBar(
                    activeStep: _response!.status + 1,
                    order: _response!,
                    callBack: _onCallBack,
                  ),
                  _tabs[_selectedTab],
                ],
              ),
            ),
          );
  }
}
