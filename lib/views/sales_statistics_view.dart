import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/model/sales_statistic.dart';
import 'package:thuctap/routes/router_name.dart';

class SalesStatisticsView extends StatelessWidget {
  const SalesStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Thống kê doanh số",
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
                  Get.toNamed( RouterName.menu);
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
      body: BodyInSalesView(),
    );
  }
}

class BodyInSalesView extends StatelessWidget {
  final List<SalesStatistic> listSalesStatistics = [
    SalesStatistic(
        inforTicket: "Vé lượt 6K (6.000 đ)\n0000011-0000011",
        numberTicket: 0,
        dateSales: "30/6/2023",
        totalSales: 0),
    SalesStatistic(
        inforTicket: "Vé HSSV (3.000 đ)\n0000010-0000010",
        numberTicket: 0,
        dateSales: "30/6/2023",
        totalSales: 0),
    SalesStatistic(
        inforTicket: "Vé miễn (0 đ)\n0000009-0000009",
        numberTicket: 0,
        dateSales: "30/6/2023",
        totalSales: 0),
  ];

  BodyInSalesView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              SearchTextField(),
              SizedBox(
                width: 15,
              ),
              SearchTextField(),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Row(
            children: [
              ButtonInBodySaleView(
                titleButton: "Tìm kiếm",
                backgroundColor: Color(0xFF1849A9),
                alignment: Alignment.center,
              ),
              SizedBox(
                width: 15,
              ),
              ButtonInBodySaleView(
                titleButton: "In tổng kết chuyến",
                backgroundColor: Color(0xFF027A48),
                alignment: Alignment.center,
              )
            ],
          ),
        ),
        const ItemTotalSalesInBody(),
        const SizedBox(
          height: 10,
        ),
        const RowTitleColumn(
          backgroundContainerColor: Color(0xFFD0D5DD),
          inforTicket: "Thông tin vé",
          numberTicket: "Số vé",
          dateSale: "Ngày bán",
          totalPrice: "Tổng tiền",
          fontSizeBase: 14,
          titleColor: Color(0xFF1D2939),
          fontWeight: FontWeight.w500,
          nameColumnAliment: Alignment.center,
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listSalesStatistics.length,
              itemBuilder: (context, index) {
                return RowTitleColumn(
                  backgroundContainerColor: Colors.white,
                  inforTicket: listSalesStatistics[index].inforTicket,
                  numberTicket:
                      listSalesStatistics[index].numberTicket.toString(),
                  dateSale: listSalesStatistics[index].dateSales,
                  totalPrice: "${listSalesStatistics[index].totalSales} đ",
                  fontSizeBase: 12,
                  titleColor: const Color(0xFF1D2939),
                  fontWeight: FontWeight.w400,
                  nameColumnAliment: Alignment.centerLeft,
                );
              }),
        )
      ],
    );
  }
}

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: TextField(
        controller: dateController,
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              size: 24,
              color: Color(0xFF1849A9),
            ),
            hintText: "dd//mm/yy",
            hintStyle: const TextStyle(color: Color(0xFF98A2B3), fontSize: 16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(width: 1, color: Color(0xFF1849A9))),
            filled: true,
            fillColor: const Color(0xFFEFF8FF)),
      ),
    );
  }
}

class ButtonInBodySaleView extends StatelessWidget {
  final String titleButton;
  final Color backgroundColor;
  final Alignment alignment;

  const ButtonInBodySaleView(
      {super.key,
      required this.titleButton,
      required this.backgroundColor,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                disabledBackgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(160, 50),
                padding: EdgeInsets.zero,
                alignment: alignment),
            child: Text(
              titleButton,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )));
  }
}

class ItemTotalSalesInBody extends StatelessWidget {
  const ItemTotalSalesInBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      color: const Color(0xFFE0F2FE),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Thu bán vé:",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Text("đ",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}

class RowTitleColumn extends StatelessWidget {
  final Color? backgroundContainerColor;
  final String? inforTicket;
  final String? numberTicket;

  final String? dateSale;

  final String? totalPrice;

  final double? fontSizeBase;

  final Color? titleColor;

  final FontWeight? fontWeight;
  final Alignment nameColumnAliment;

  const RowTitleColumn(
      {super.key,
      required this.backgroundContainerColor,
      required this.inforTicket,
      required this.numberTicket,
      required this.dateSale,
      required this.totalPrice,
      required this.fontSizeBase,
      required this.titleColor,
      required this.fontWeight,
      required this.nameColumnAliment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            width: 135,
            height: 39,
            alignment: nameColumnAliment,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              inforTicket!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 50,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              numberTicket!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 80,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              dateSale!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          ),
          Container(
            width: 117,
            height: 39,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundContainerColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1),
                border: Border.all(color: Colors.white, width: 1)),
            child: Text(
              totalPrice!,
              style: TextStyle(
                  fontSize: fontSizeBase,
                  color: titleColor,
                  fontWeight: fontWeight),
            ),
          )
        ],
      ),
    );
  }
}
