import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pro_plus_logic_machine_test/constants/colors.dart';
import 'package:pro_plus_logic_machine_test/constants/sized_box.dart';
import 'package:pro_plus_logic_machine_test/controller/api_controller.dart';
import 'package:pro_plus_logic_machine_test/model/notification_service.dart';

// ignore: must_be_immutable
class ScreenBuyNow extends StatelessWidget {
  final controller = Get.find<ApiController>();
  int newindex;
  ScreenBuyNow({Key? key, required this.newindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: black,
                      size: 29,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Living Room",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                  ),
                ],
              ),
              sizeH20,
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                                controller.product![newindex + 1].images![0]),
                            fit: BoxFit.fill),
                      ),
                      height: height * 0.5,
                      width: width * 0.9,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: -24,
                            right: 30,
                            child: FloatingActionButton(
                                heroTag: "btr$newindex",
                                backgroundColor: yellow,
                                foregroundColor: white,
                                splashColor: white,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.clear,
                                )),
                          ),
                          Positioned(
                            bottom: -24,
                            right: 120,
                            child: FloatingActionButton(
                                heroTag: "bth$newindex",
                                backgroundColor: yellow,
                                foregroundColor: white,
                                splashColor: white,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.favorite,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Rating",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              sizeH30,
              SizedBox(
                height: 100,
                width: 400,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  controller.product![newindex + 1].title.toString(),
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.w500, color: black),
                ),
              ),
              Flexible(
                child: Text(
                  controller.product![newindex + 1].description.toString(),
                  style: const TextStyle(
                      height: 1.5,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: black),
                ),
              ),
              sizeH30,
              Row(
                children: [
                   Text(
                    "\$ ${controller.product![newindex + 1].price.toString()}",
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 50),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          primary: white),
                      onPressed: () {},
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 17, color: black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          primary: yellow),
                      onPressed: () {
                        notification(
                            controller.product![newindex + 1].title.toString(),
                            controller.product![newindex + 1].price.toString(),
                            "url");
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 17, color: white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
