import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/model/broad_synchronized_data.dart';

class SynchronizedDataView extends StatelessWidget {
  final List<BroadSynchronizedData> listBroadData = [
    BroadSynchronizedData(
        nameTicket: "Vé lượt 6k",
        numberTicket: 5000001,
        totalSales: 6000,
        dateSales: "30/06/2023",
        status: "Đã đồng bộ"),
    BroadSynchronizedData(
        nameTicket: "Vé HSSV",
        numberTicket: 0,
        totalSales: 3000,
        dateSales: "30/06/2023",
        status: "Đã đồng bộ"),
    BroadSynchronizedData(
        nameTicket: "Vé lượt 6k",
        numberTicket: 5000001,
        totalSales: 6000,
        dateSales: "30/06/2023",
        status: "Đã đồng bộ"),
    BroadSynchronizedData(
        nameTicket: "Vé lượt 6k",
        numberTicket: 5000001,
        totalSales: 6000,
        dateSales: "30/06/2023",
        status: "Đã đồng bộ"),
    BroadSynchronizedData(
        nameTicket: "Vé lượt 6k",
        numberTicket: 5000001,
        totalSales: 6000,
        dateSales: "30/06/2023",
        status: "Đã đồng bộ"),
  ];

  SynchronizedDataView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dữ liệu đồng bộ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
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
      body: Column(
        children: [
          const CustomBroadDetails(
            backgroundContainerColor: Color(0xFFD0D5DD),
            fontSizeBase: 14,
            titleColor: Color(0xFF1D2939),
            fontWeight: FontWeight.w500,
            columnFirst: 'Tên loại vé',
            columnSecond: 'Số vé',
            columnThird: 'Giá tiền',
            columnFourth: 'Ngày bán',
            columnFifth: 'Trạng thái',
            statusColor: Color(0xFF1D2939),
            nameColumnAliment: Alignment.center,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listBroadData.length,
                itemBuilder: (context, index) {
                  return CustomBroadDetails(
                    backgroundContainerColor: Colors.white,
                    fontSizeBase: 12,
                    titleColor: const Color(0xFF1D2939),
                    fontWeight: FontWeight.w400,
                    columnFirst: listBroadData[index].nameTicket,
                    columnSecond: listBroadData[index].numberTicket.toString(),
                    columnThird: listBroadData[index].totalSales.toString(),
                    columnFourth: listBroadData[index].dateSales,
                    columnFifth: listBroadData[index].status,
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

class CustomBroadDetails extends StatelessWidget {
  final Color? backgroundContainerColor;
  final String? columnFirst;
  final String? columnSecond;
  final String? columnThird;
  final String? columnFourth;
  final String? columnFifth;

  final double? fontSizeBase;

  final Color? titleColor;

  final Color? statusColor;

  final FontWeight? fontWeight;
  final Alignment nameColumnAliment;

  const CustomBroadDetails(
      {super.key,
      required this.backgroundContainerColor,
      required this.fontSizeBase,
      required this.titleColor,
      required this.fontWeight,
      required this.columnFirst,
      required this.columnSecond,
      required this.columnThird,
      required this.columnFourth,
      required this.columnFifth,
      required this.statusColor,
      required this.nameColumnAliment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
      child: Row(
        children: [
          Container(
            width: 85,
            height: 39,
            alignment: nameColumnAliment,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              columnFirst!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 67,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              columnSecond!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 61,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              columnThird!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 82,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              columnFourth!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 85,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              columnFifth!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: statusColor,
                  fontWeight: fontWeight),
            ),
          )
        ],
      ),
    );
  }
}
