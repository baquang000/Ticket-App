import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/routes/router_name.dart';

class SelectRouteView extends StatefulWidget {
  const SelectRouteView({super.key});

  @override
  State<SelectRouteView> createState() => _SelectRouteViewState();
}

class _SelectRouteViewState extends State<SelectRouteView> {
  bool _isChangeTitle = false;
  bool _isShowIconCache = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            !_isChangeTitle ? "51B77788 - Chọn chuyến" : "51B77788 - Bán vé",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFFFD853A),
          actions: [
            _isShowIconCache
                ? IconButton(
                    onPressed: () {
                      Get.toNamed(RouterName.synchronizedData);
                    },
                    icon: const Icon(
                      Icons.cached,
                      size: 24,
                      color: Colors.white,
                    ))
                : const SizedBox.shrink(),
            IconButton(
                onPressed: () {
                  Get.toNamed(RouterName.menu);
                },
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                  color: Colors.white,
                ))
          ],
        ),
        body: BodyOfSelectedRoute(
          isSelected: (bool isChangeTitle) {
            setState(() {
              _isChangeTitle = isChangeTitle;
            });
          },
          isShowIconCache: (bool isShowIcon) {
            setState(() {
              _isShowIconCache = isShowIcon;
            });
          },
        ));
  }
}

class RouteButton extends StatelessWidget {
  final int child;
  final int index;
  final int? selectedIndex;
  final bool isStart;
  final VoidCallback onPressed;

  const RouteButton(
      {super.key,
      required this.child,
      required this.index,
      required this.selectedIndex,
      required this.onPressed, required this.isStart});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed:   onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedIndex == null
              ? const Color(0xFFF04438)
              : selectedIndex == index
                  ? const Color(0xFF1849A9)
                  : const Color(0xFFF2F4F7),
          foregroundColor: selectedIndex == index || selectedIndex == null
              ? Colors.white
              : Colors.grey.shade500,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(width: 2, color: Color(0xFFD0D5DD))),
          minimumSize: const Size(60, 60),
        ),
        child: Text(
          "$child",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ));
  }
}

class BodyOfSelectedRoute extends StatefulWidget {
  final Function(bool) isSelected;
  final Function(bool) isShowIconCache;

  const BodyOfSelectedRoute(
      {super.key, required this.isSelected, required this.isShowIconCache});

  @override
  State<BodyOfSelectedRoute> createState() => _BodyOfSelectedRouteState();
}

class _BodyOfSelectedRouteState extends State<BodyOfSelectedRoute> {
  final List _route = [77, 89, 90, 141, 164];

  int? selectedIndex;
  bool _isShowTicketAndButton = false;
  int? _numberRoute;
  bool _isStart = false;
  bool _isShowIconCache = false;

  void sendIsChangeTitle(bool isChangeTitle) {
    widget.isSelected(isChangeTitle);
  }

  void sendIsShowIconCache(bool isShowIcon) {
    widget.isShowIconCache(isShowIcon);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          height: 100,
          color: const Color(0xFFE0F2FE),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _route.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: RouteButton(
                        index: index,
                        selectedIndex: selectedIndex,
                        onPressed: !_isStart ? () {
                          setState(() {
                              selectedIndex = index;
                              _isShowTicketAndButton = true;
                              _numberRoute = _route[index];
                              sendIsChangeTitle(_isShowTicketAndButton);
                          });
                        } : (){},
                        isStart: _isStart,
                        child: _route[index],
                      ),
                    );
                  })),
        ),
        _isShowTicketAndButton
            ? SelectTicket(
                numberRoute: _numberRoute,
                isStart: _isStart,
              )
            : const SizedBox(
                height: 480,
              ),
        Padding(
          padding: const EdgeInsets.only(right: 22, left: 23),
          child: ElevatedButton(
              onPressed: !_isShowTicketAndButton
                  ? null
                  : () {
                      setState(() {
                        _isStart = !_isStart;
                        _isShowIconCache = !_isShowIconCache;
                        if (_isStart == false) {
                          _isShowTicketAndButton = !_isShowTicketAndButton;
                          selectedIndex = null;
                          _isShowTicketAndButton = false;
                          _numberRoute = null;
                          sendIsChangeTitle(_isStart);
                        }
                        sendIsShowIconCache(_isShowIconCache);
                      });
                    },
              style: ElevatedButton.styleFrom(
                  backgroundColor: _isShowTicketAndButton
                      ? (_isStart
                          ? const Color(0xFFD92D20)
                          : const Color(0xFF1849A9))
                      : const Color(0xFFF2F4F7),
                  foregroundColor: _isShowTicketAndButton
                      ? const Color(0xFFFCFCFD)
                      : const Color(0xFFD0D5DD),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD0D5DD))),
                  minimumSize: const Size(330, 50)),
              child: Text(
                _isStart ? "Kết thúc chuyến" : "Bắt đầu chuyến",
                style: const TextStyle(fontSize: 18),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: !_isShowTicketAndButton
                      ? null
                      : () {
                          Get.toNamed(RouterName.salesStatistics);
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _isShowTicketAndButton
                          ? const Color(0xFFFEC84B)
                          : const Color(0xFFF2F4F7),
                      foregroundColor: _isShowTicketAndButton
                          ? const Color(0xFFFCFCFD)
                          : const Color(0xFFD0D5DD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              width: 1, color: Color(0xFFD0D5DD))),
                      minimumSize: const Size(160, 50)),
                  child: const Text(
                    "Thống kê",
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: !_isShowTicketAndButton
                      ? null
                      : () {
                          Get.toNamed(RouterName.summaryOfDay);
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _isShowTicketAndButton
                          ? const Color(0xFF027A48)
                          : const Color(0xFFF2F4F7),
                      foregroundColor: _isShowTicketAndButton
                          ? const Color(0xFFFCFCFD)
                          : const Color(0xFFD0D5DD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              width: 1, color: Color(0xFFD0D5DD))),
                      minimumSize: const Size(160, 50)),
                  child: const Text(
                    "Tổng kết ngày",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}

class SelectTicket extends StatelessWidget {
  final int? numberRoute;
  final bool? isStart;

  const SelectTicket(
      {super.key, required this.numberRoute, required this.isStart});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Container(
            width: 365,
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xFFD1FADF),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 11, 15, 11),
                  child: Column(
                    children: [
                      const Text(
                        "Tuyến",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "($numberRoute)",
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Text(
                    "Bến xe buýt Sài Gòn - Bến xe buýt Quận 8",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TicketImageNotSelected(
                imageUrl: isStart == true
                    ? "assets/images/ticket7000e.png"
                    : "assets/images/ticket7000.png",
              ),
              TicketImageNotSelected(
                imageUrl: isStart == true
                    ? "assets/images/ticket3000e.png"
                    : "assets/images/ticket3000.png",
              ),
              TicketImageNotSelected(
                imageUrl: isStart == true
                    ? "assets/images/ticketfreeE.png"
                    : "assets/images/tikketfree.png",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              TicketImageNotSelected(
                imageUrl: isStart == true
                    ? "assets/images/ticket4000e.png"
                    : "assets/images/ticket4000.png",
              ),
              const SizedBox(
                width: 10,
              ),
              TicketImageNotSelected(
                imageUrl: isStart == true
                    ? "assets/images/ticket3000hse.png"
                    : "assets/images/tickeths.png",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 97,
        )
      ],
    );
  }
}

class TicketImageNotSelected extends StatelessWidget {
  final String imageUrl;

  const TicketImageNotSelected({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(imageUrl);
  }
}
