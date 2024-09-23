import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/routes/router_name.dart';

class LoginViews extends StatefulWidget {
  const LoginViews({super.key});

  @override
  State<LoginViews> createState() => _LoginViewsState();
}

class _LoginViewsState extends State<LoginViews> {
  late TextEditingController userController;
  late TextEditingController passwordController;
  String user = "";
  String password = "";
  bool? isChecked = true;

  @override
  void initState() {
    super.initState();
    userController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 56, right: 70, left: 71),
            child: Text(
              "HỆ THỐNG QUẢN LÝ VÉ ĐIỆN TỬ",
              style: TextStyle(
                  fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 144,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: userController,
              onChanged: (user) {
                setState(() {
                  user = userController.text;
                });
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFEFF8FF),
                  label: const Text(
                    'Tài khoản',
                    style: TextStyle(fontSize: 18, color: Color(0xFF98A2B3)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF1849A9))),
                  prefixIcon: Image.asset(
                    'assets/images/user.png',
                    width: 24,
                    height: 24,
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: userController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFEFF8FF),
                  label: const Text(
                    'Mật khẩu',
                    style: TextStyle(fontSize: 18, color: Color(0xFF98A2B3)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xFF1849A9))),
                  suffixIcon: Image.asset(
                    'assets/images/visibility_black_24dp.png',
                    width: 24,
                    height: 24,
                  ),
                  prefixIcon: Image.asset(
                    'assets/images/locked.png',
                    width: 16,
                    height: 16,
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (newCheck) {
                      setState(() {
                        isChecked = newCheck;
                      });
                    },
                    activeColor: const Color(0xFF1849A9),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Lưu mật khẩu đăng nhập",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1D2939),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 86, left: 79),
            child: ElevatedButton(
              onPressed: () {
                  Get.offAllNamed(RouterName.selectedRoute);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1849A9),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
              minimumSize: const Size(210, 46)),
              child: const Text(
                "Đăng nhập",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
