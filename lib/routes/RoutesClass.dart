import 'package:get/get.dart';
import 'package:loan_project/Binding/submit_binding.dart';
import 'package:loan_project/view/submit_screen.dart';


import '../Binding/home_binding.dart';
import '../view/home_screen.dart';



class RoutesClass {
  //BR1
  static String home = '/home';
  static String submit = '/submit';



  //BR1
  static String gotoHome() => home;
  static String gotoSubmit() => submit;


  //BR1
  static List<GetPage> routes = [
   GetPage(
        name: home,
        page: () =>  HomeScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: HomeBinding()
    ),
/*    GetPage(
        name: walkthrough,
        page: () =>  WalkThrough(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: WalkthroughBinding()
    )*/


    GetPage(
        name: submit,
        page: () =>  SubmitScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: SubmitBinding()
    ),
  ];
}
