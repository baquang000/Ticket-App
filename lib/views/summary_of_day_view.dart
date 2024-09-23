import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/views/synchronized_data_view.dart';

import '../model/summary_of_day.dart';
import '../routes/router_name.dart';

class SummaryOfDayView extends StatelessWidget {
  final List<SummaryOfDay> listSummary = [
    SummaryOfDay(
        nameTicket: 'Vé lượt 6k',
        numberFirst: 0000000,
        numberLast: 0000000,
        total: 6000,
        sl: 0),
    SummaryOfDay(
        nameTicket: 'Vé HSSV',
        numberFirst: 0000000,
        numberLast: 0000000,
        total: 3000,
        sl: 0),
    SummaryOfDay(
        nameTicket: 'Vé miễn',
        numberFirst: 0000000,
        numberLast: 0000000,
        total: 0,
        sl: 0),
  ];

  SummaryOfDayView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Tổng kết ngày",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: const Color(0xFFFD853A),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(RouterName.synchronizedData);
                },
                icon: const Icon(
                  Icons.cached,
                  size: 24,
                  color: Colors.white,
                )),
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
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: Colors.white,
            )),),
      body: Column(
        children: [
          const CustomBroadDetails(
            backgroundContainerColor: Color(0xFFD0D5DD),
            fontSizeBase: 14,
            titleColor: Color(0xFF1D2939),
            fontWeight: FontWeight.w500,
            columnFirst: 'Tên loại vé',
            columnSecond: 'Số đầu',
            columnThird: 'Số cuối',
            columnFourth: 'Giá tiền',
            columnFifth: 'SL',
            statusColor: Color(0xFF1D2939),
            nameColumnAliment: Alignment.center,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listSummary.length,
                itemBuilder: (context, index) {
                  return CustomBroadDetails(
                    backgroundContainerColor: Colors.white,
                    fontSizeBase: 12,
                    titleColor: const Color(0xFF1D2939),
                    fontWeight: FontWeight.w400,
                    columnFirst: listSummary[index].nameTicket,
                    columnSecond: listSummary[index]
                        .numberFirst
                        .toString()
                        .padLeft(7, '0'),
                    columnThird: listSummary[index]
                        .numberLast
                        .toString()
                        .padLeft(7, '0'),
                    columnFourth: listSummary[index].total.toString(),
                    columnFifth: listSummary[index].sl.toString(),
                    statusColor: const Color(0xFF027A48),
                    nameColumnAliment: Alignment.centerLeft,
                  );
                }),
          )
        ],
      ),
    );
  }
}
