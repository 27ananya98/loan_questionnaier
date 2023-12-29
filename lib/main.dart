import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_project/resources/colors.dart';
import 'package:get/get.dart';
import 'package:loan_project/routes/RoutesClass.dart';
import 'package:loan_project/view/home_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            /* set Status bar color in Android devices. */
            statusBarIconBrightness: Brightness.dark,
            /* set Status bar icons color in Android devices.*/
            statusBarBrightness: Brightness.dark) /* set Status bar icon color in iOS. */
    );

    return GetMaterialApp(
      title: 'Loan Questionnaire',
      theme: ThemeData(
        primaryColor: Color(appColors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(appColors.black),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textSelectionTheme:
        const TextSelectionThemeData(cursorColor: Colors.black),
        colorScheme: ColorScheme.light(secondary: Color(appColors.secondaryColor)),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      getPages: RoutesClass.routes,
      initialRoute: RoutesClass.gotoHome(),
    );
  }
}

abstract class ParentWidget extends StatelessWidget {
  const ParentWidget({Key? key}) : super(key: key);
  Widget buildingView(BuildContext context, double h, double w);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        top: false,
        child: buildingView(context, h, w),
      ),
    );
  }
}
