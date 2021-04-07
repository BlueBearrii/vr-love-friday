import 'package:flutter/material.dart';
import 'package:friday/common/custom_size.dart';
import 'package:friday/components/app/booking/booking_select.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final customSize = new CustomSize();
  final List litems = [
    "button title",
    "add",
    "list title",
  ];

  getListItems() {
    setState(() {
      litems.add({
        "title": "index 1",
        "booking_id": "23213829",
        "check-in": DateFormat.yMMMd().format(DateTime.now()),
        "check-out":
            DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 2))),
        "location": "Bangkok",
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"
      });
      litems.add({
        "title": "index 2",
        "booking_id": "28104820",
        "check-in": DateFormat.yMMMd().format(DateTime.now()),
        "check-out":
            DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 2))),
        "location": "Phuket",
        "image":
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg"
      });
      litems.add({
        "title": "index 3",
        "booking_id": "69280468",
        "check-in": DateFormat.yMMMd().format(DateTime.now()),
        "check-out":
            DateFormat.yMMMd().format(DateTime.now().add(Duration(days: 2))),
        "location": "Rayong",
        "image":
            "https://colossalvacation.com/wp-content/uploads/2019/09/rayong.jpg"
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getListItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white54,
      body: Container(
        child: ListView.builder(
            itemCount: litems.length,
            itemBuilder: (context, index) {
              if (litems[index] == "button title") {
                return Container(
                  width: customSize.getWidth(100, context),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(children: [
                    Text(
                      "New booking",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ]),
                );
              } else if (litems[index] == "add") {
                return Container(
                  width: customSize.getWidth(100, context),
                  height: customSize.getHeight(8, context),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Navigator.pushNamed(context, "/create_booking");
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                );
              } else if (litems[index] == "list title") {
                return Container(
                  width: customSize.getWidth(100, context),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(children: [
                    Text(
                      "History",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ]),
                );
              } else {
                return Container(
                  width: customSize.getWidth(100, context),
                  height: customSize.getHeight(20, context),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookingSelect(data: litems[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 0.0, color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Row(
                        children: [
                          Container(
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.network(
                                litems[index]["image"],
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      litems[index]["title"],
                                      overflow: TextOverflow.clip,
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Booking id : ${litems[index]["booking_id"]}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(litems[index]["check-in"]
                                            .toString()),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Icon(
                                            Icons.arrow_right_alt,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        Text(litems[index]["check-out"]
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        litems[index]["location"],
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.money_off,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        Text(
                                          "1000",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[500],
                                          size: 16,
                                        ),
                                        Text(
                                          "5.0",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
