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

final objcontroller = Get.find<ApiController>();

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
            sizeH20,
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: GetBuilder<ApiController>(
                init: ApiController(),
                builder: (
                  controller,
                ) {
                  return SizedBox(
                    height: height * 0.04,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.category.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Container(
                              width: width * 0.10,
                              padding: const EdgeInsets.all(8),
                              color: (controller.categoryIndex.value == index)
                                  ? Colors.grey
                                  : const Color.fromARGB(255, 220, 220, 220),
                              child: Center(
                                  child: Text(controller.category[index])),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            sizeH30,
            // const ScrollingCatogoryButtons(),
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
                                            image: controller.product![index]
                                                        .images[0] ==
                                                    null
                                                ? NetworkImage(
                                                    "data:image/png;base64,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")
                                                : NetworkImage(controller
                                                    .product![index].images[0]),
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
                                              "\$ ${controller.product![index ].price.toString()}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -65,
                                            left: 10,
                                            child: Text(
                                              controller.product![index ]
                                                  .category.name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: -50,
                                            left: 10,
                                            child: SizedBox(
                                              width: 150,
                                              height: 40,
                                              child: Text(
                                                controller
                                                    .product![index ].title
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
                  objcontroller.clearUser();
                  objcontroller.update();
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
