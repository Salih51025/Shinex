import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shinex/bindings/general_bindings.dart';
import 'package:shinex/data/repositories/authentication/authentication_repositories.dart';
import 'package:shinex/firebase_options.dart';
import 'package:shinex/utils/constants/colors.dart';
import 'package:shinex/utils/theme/theme.dart';

Future<void> main() async {
  /// Widgets Binding[Widget Bağlama]
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storage[GetX Yerel Depolama]
  await GetStorage.init();

  /// -- Await Splash until other items load[Diğer öğeler yüklenene kadar Splash'ı bekleyin]
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase & Authentication Repository[Firebase ve Kimlik Doğrulama Deposunu Başlat]
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SHINEX',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.dartTheme,
      initialBinding: GeneralBindigs(),
      home: const Scaffold(
          backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
