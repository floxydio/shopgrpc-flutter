import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopprotoflutter/bloc/auth/login/login_cubit.dart';
import 'package:shopprotoflutter/bloc/auth/signup/signup_cubit.dart';
import 'package:shopprotoflutter/bloc/products/product_cubit.dart';
import 'package:shopprotoflutter/config/grpc_init.dart';
import 'package:shopprotoflutter/presentation/auth/screens/auth_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopprotoflutter/presentation/home/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final channel = GrpcInit.clientChannel();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(channel: channel)),
        BlocProvider(create: (context) => SignUpCubit(channel: channel)),
        BlocProvider(create: (context) => ProductCubit(channel: channel))
      ],
      child: MaterialApp(
          theme: ThemeData(
              useMaterial3: false, textTheme: GoogleFonts.poppinsTextTheme()),
          home: const ShopMain())));
}

class ShopMain extends StatefulWidget {
  const ShopMain({super.key});

  @override
  State<ShopMain> createState() => _ShopMainState();
}

class _ShopMainState extends State<ShopMain> {
  void checkLogin() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    var role = prefs.getString("role");
    Future.delayed(const Duration(seconds: 2), () {
      if (token != null && role != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AuthLoginPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
