
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pro_plus_logic_machine_test/constants/colors.dart';
import 'package:pro_plus_logic_machine_test/constants/icons.dart';
import 'package:pro_plus_logic_machine_test/constants/sized_box.dart';

class ScreeenHomePage extends StatefulWidget {
  const ScreeenHomePage({Key? key}) : super(key: key);

  @override
  State<ScreeenHomePage> createState() => _ScreeenHomePageState();
}

class _ScreeenHomePageState extends State<ScreeenHomePage> {
  int cartBadgeCount = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            sizeH50,
            appbarHomepage(),
            sizeH30,
            const ScrollingCatogoryButtons(),
            gridviewLayout(context)
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
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 25, top: 8, bottom: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: selectCategoryButtonColor),
            onPressed: () {},
            child: const Text(
              "Living Room",
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}

Widget gridviewLayout(BuildContext context) {
  return SizedBox(
    height: 800,
    child: MasonryGridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: gridTileWidgetdemo(index),
        );
      },
    ),
  );
}

gridTileWidgetdemo(int index) {
  return Column(
    children: [
      Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://source.unsplash.com/random?sig=$index",
                ),
              ),
              Container(
                height: 50,
              )
            ],
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: yellow,
              foregroundColor: Colors.white,
              splashColor: Color.fromARGB(255, 249, 249, 249),
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      Text("jahsdjklfjkfh")
    ],
  );
}

ClipRRect gridTileWidget(int index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Image.network("https://source.unsplash.com/random?sig=$index"),
  );
}
