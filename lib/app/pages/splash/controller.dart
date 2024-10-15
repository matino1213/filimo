import 'package:filimo/app/common/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashController extends GetxController {
  final RxString _connectionStatus = '-1'.obs;
  final Rx<Connectivity> _connectivity = Connectivity().obs;
  late Rx<List<ConnectivityResult>> result = Rx<List<ConnectivityResult>>([]);

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.wifi)) {
      _connectionStatus.value = 'wifi net';
    } //
    else if (result.contains(ConnectivityResult.mobile)) {
      _connectionStatus.value = 'mobile net';
    } //
    else if (result.contains(ConnectivityResult.none)) {
      _connectionStatus.value = '-1';
      Get.snackbar(
        'اینترنت شما قطع می باشد',
        'لطفا نت همراه یا وای فایل را وصل کنید.',
        icon: const Icon(CupertinoIcons.wifi_slash),
      );
    } //
    else {
      _connectionStatus.value = 'Failed to get connectivity.';
    }
    if (_connectionStatus.value != '-1') {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoute.HOME);
      });
    }
  }

  Future<void> initConnectivity() async {
    result.value = await _connectivity.value.checkConnectivity();

    return _updateConnectionStatus(result.value);
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    ever(result, (_) {
      _connectivity.value.onConnectivityChanged.listen(_updateConnectionStatus);
    });
  }
}
