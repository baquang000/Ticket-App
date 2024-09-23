import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFD853A),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: Colors.white,
            )),
      ),
      body: const BodyInMenu(),
    );
  }
}

class BodyInMenu extends StatelessWidget {
  const BodyInMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1, color: const Color(0xFFD0D5DD))),
                child: const Icon(
                  Icons.person,
                  size: 36,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const SizedBox(
                width: 205,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tên tài khoản",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400),
                    ),
                    Text("Thông tin cá nhân",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF98A2B3),
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              const SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.logout_outlined,
                      size: 30,
                      color: Color(0xFF323232),
                    )),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          color: Color(0xFFD0D5DD),
        ),
        const ItemCustomInMenu(
          leadingIcon: Icons.punch_clock,
          title: 'Đổi mật khẩu',
          suffixIcon: Icons.arrow_forward_ios,
        ),
        const Divider(
          height: 1,
          color: Color(0xFFD0D5DD),
        ),
        const ItemCustomInMenuWithImage(
            leadingIcon: "assets/images/radio-pole.png",
            title: "Kết nối máy in bluetooth",
            suffixIcon: Icons.arrow_forward_ios),
        const Divider(
          height: 1,
          color: Color(0xFFD0D5DD),
        ),
        const ItemCustomInMenu(
          leadingIcon: Icons.info_outline,
          title: 'Phiên bản hiện tại 1.0.36 \n(10000036)',
          suffixIcon: Icons.download_outlined,
        ),
        const Divider(
          height: 1,
          color: Color(0xFFD0D5DD),
        ),
      ],
    );
  }
}

class ItemCustomInMenu extends StatelessWidget {
  final IconData leadingIcon;
  final String? title;
  final IconData? suffixIcon;

  const ItemCustomInMenu({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            leadingIcon,
            size: 24,
            color: Colors.black,
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 245,
            child: Text(
              title!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                suffixIcon,
                size: 24,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

class ItemCustomInMenuWithImage extends StatelessWidget {
  final String? leadingIcon;
  final String? title;
  final IconData? suffixIcon;

  const ItemCustomInMenuWithImage({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            leadingIcon!,
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 245,
            child: Text(
              title!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                suffixIcon,
                size: 24,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
