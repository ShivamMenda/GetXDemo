import 'package:get/get.dart';
import 'package:getx_demo/res/routes/routes_names.dart';
import 'package:getx_demo/view/api_screen.dart';
import 'package:getx_demo/view/home_page.dart';
import 'package:getx_demo/view/image_picker_page.dart';
import 'package:getx_demo/view/login_signup_page.dart';
import 'package:getx_demo/view/splash_screen.dart';
import 'package:getx_demo/view/state_page.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(name: RoutesNames.splashScreen, page: () => SplashScreen()),
        GetPage(name: RoutesNames.homeScreen, page: () => HomePage()),
        GetPage(name: RoutesNames.stateScreen, page: () => StatePage()),
        GetPage(
            name: RoutesNames.imagePickScreen, page: () => ImagePickerPage()),
        GetPage(name: RoutesNames.loginScreen, page: () => LoginSignupPage()),
        GetPage(name: RoutesNames.apiScreen, page: () => ApiView()),
      ];
}
