import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro_plus_logic_machine_test/constants/colors.dart';
import 'package:pro_plus_logic_machine_test/constants/icons.dart';
import 'package:pro_plus_logic_machine_test/constants/sized_box.dart';
import 'package:pro_plus_logic_machine_test/controller/api_controller.dart';
import 'package:pro_plus_logic_machine_test/view/screen_buy_now.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ScreeenHomePage extends StatefulWidget {
  const ScreeenHomePage({Key? key}) : super(key: key);
  @override
  State<ScreeenHomePage> createState() => _ScreeenHomePageState();
}

final controller = Get.find<ApiController>().validateuser();

class _ScreeenHomePageState extends State<ScreeenHomePage> {
  final controller = Get.find<ApiController>();
  int cartBadgeCount = 3;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            sizeH50,
            appbarHomepage(),
            sizeH30,
            const ScrollingCatogoryButtons(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GetBuilder<ApiController>(
                  init: ApiController(),
                  builder: (controller) => controller.product == null
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.teal,
                        ))
                      : StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          crossAxisCount: 2,
                          itemCount: controller.product!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => ScreenBuyNow(newindex: index));
                              },
                              child: Container(
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
                                            image: NetworkImage(controller
                                                .product![index + 1]
                                                .images![0]),
                                            fit: BoxFit.fill),
                                      ),
                                      height: (index % 2 == 0)
                                          ? height * 0.21
                                          : height * 0.35,
                                      width: width * 0.46,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            bottom: -24,
                                            right: 10,
                                            child: FloatingActionButton(
                                              heroTag: "btn$index",
                                              backgroundColor: yellow,
                                              foregroundColor: white,
                                              splashColor: white,
                                              onPressed: () {},
                                              child: const Icon(Icons.add),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -60,
                                            right: 20,
                                            child: Text(
                                              "\$ ${controller.product![index + 1].price.toString()}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -65,
                                              left: 10,
                                              child: Text(
                                                controller.product![index + 1]
                                                    .category!.name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Positioned(
                                            bottom: -50,
                                            left: 10,
                                            child: SizedBox(
                                              width: 150,
                                              height: 40,
                                              child: Text(
                                                controller
                                                    .product![index + 1].title
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (int index) {
                            return StaggeredTile.count(
                                1, (index % 2 == 0) ? 1.2 : 1.8);
                          },
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 8,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row appbarHomepage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            "Discover",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w600, color: black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Badge(
              badgeContent: Text(
                cartBadgeCount.toString(),
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: white),
              ),
              position: BadgePosition.topEnd(),
              shape: BadgeShape.circle,
              badgeColor: yellow,
              borderRadius: BorderRadius.circular(8),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    cartBadgeCount += 1;
                  });
                },
                icon: const Icon(
                  cart,
                  size: 38,
                ),
              )),
        )
      ],
    );
  }
}

class ScrollingCatogoryButtons extends StatelessWidget {
  const ScrollingCatogoryButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int initial = 1;
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 25, top: 8, bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: initial == 1 ? selectCategoryButtonColor : grey),
                onPressed: () {},
                child: Text(
                  "Living Room",
                  style: TextStyle(
                    fontSize: 17,
                    color: initial == 1 ? white : black,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
