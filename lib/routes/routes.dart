import 'package:empiregarage_mobile/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class RouteClass{
  static String welcomeScreen = "/";





  static getWelcomeScreenRoute() => welcomeScreen;

  static List<GetPage> routes = [
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
  ];
}