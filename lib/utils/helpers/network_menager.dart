import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shinex/utils/popups/loaders.dart';

class NetworkMenager extends GetxController {
  static NetworkMenager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.[Ağ yöneticisini başlatın ve bağlantı durumunu sürekli olarak kontrol etmek için bir akış ayarlayın.]
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      _updateConnectionStatus;
    });
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.[Bağlantıdaki değişikliklere göre bağlantı durumunu güncelleyin ve internet bağlantısı olmadığında ilgili açılır pencereyi gösterin.]
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.customToast(message: 'İnternet bağlantısı yok');
    }
  }

  /// Check the Internet connection status.[İnternet bağlantı durumunu kontrol edin.]
  /// Returns 'true' if connected, 'false' otherwise.[Bağlıysa 'true', aksi durumda 'false' değerini döndürür.]
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      // ignore: unrelated_type_equality_checks
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.[Etkin bağlantı akışını atın veya kapatın.]
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
