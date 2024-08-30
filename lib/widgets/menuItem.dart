import 'package:flutter/material.dart';
import 'package:small_res/models/menuItem.model.dart';
import 'package:transparent_image/transparent_image.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
    required this.menuItem,
  });

  final AsyncSnapshot<List<MenuItem>> menuItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: menuItem.data!.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          'http://localhost:8080/api/res/${menuItem.data![index].imageUrl}'
                        ),
                        Positioned(
                          child: Container(
                            color: Colors.black54,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 44,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  menuItem.data![index].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
