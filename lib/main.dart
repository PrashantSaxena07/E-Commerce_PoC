import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foot_wear_v6001/providers/cart_provider.dart';
import 'package:foot_wear_v6001/providers/orders_provider.dart';
import 'package:foot_wear_v6001/providers/products_provider.dart';
import 'package:foot_wear_v6001/register/root/root.dart';
import 'package:foot_wear_v6001/register/state/curent_user.dart';
import 'package:foot_wear_v6001/screens/home_page.dart';
import 'package:foot_wear_v6001/screens/screen_ProductDetail.dart';
import 'package:foot_wear_v6001/screens/screen_cart.dart';
import 'package:foot_wear_v6001/screens/screen_detailList.dart';
import 'package:foot_wear_v6001/widgets/item_ProductCard.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'constants/localization/app_localization_deligate.dart';
import 'constants/prefrences.dart';
import 'constants/theme/theme_provider.dart';
import 'package:flutter/services.dart' as rootBundle;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  /*//localization late initializer
  Preference.load().then((value) {
    runApp(MyApp());
  });*/
  Preference.load().then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeProvider.initializer()),
        ChangeNotifierProvider.value(value: CurrentUser())
      ],
      child: MyApp(),
    ));
  });
}
class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  void initState() {
    var lang = Preference.getString(Preference.language, def: "en");
    _locale = Locale(lang ?? "en");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var lang = Preference.getString(Preference.language, def: "en");
    _locale = Locale(lang ?? "en");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        /*ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),*/
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        locale: _locale,
        supportedLocales: [
          Locale('en', ''),
          Locale('fr', ''),
        ],
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              _locale = supportedLocale;
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        // theme: theme.themeMode,

        theme: ThemeData(
          canvasColor: ColorConstants.color1,
          scaffoldBackgroundColor: ColorConstants.color1,
        ),
        // home: SplashScreen(),
        home: const OurRoot(),
        // home: const MainScreen(),

        routes: {
          ProductsDetailScreen.routeName: (ctx) => ProductsDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen()
        },
        // home: MainScreen(),
      ),
    );
  }
}

  Future<List<ProductDataModel>> ReadJsonData() async {
  //read json file
  final jsondata = await rootBundle.rootBundle.loadString('assets/products.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => ProductDataModel.fromJson(e)).toList();
}
