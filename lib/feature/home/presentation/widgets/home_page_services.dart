import 'package:flutter/material.dart';
import 'package:garagewa/core/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:garagewa/feature/home/domain/entities/services.dart';

class HomeServices extends StatelessWidget {
  final List<Services?> item;
  const HomeServices({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(item);
    return item.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("No Service Found")],
          )
        : StaggeredGrid.count(
            crossAxisCount: 4, // Number of items in the cross axis
            mainAxisSpacing: 5, // Spacing between items along the main axis
            crossAxisSpacing: 5, // Spacing between items along the cross axis
            children: [
              ...item.map((e) => GestureDetector(
                    onTap: () {
                      // if (store.hepticSwitch) {
                      //   HapticFeedback.vibrate();
                      // }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CarService(
                      //       serviceId: e['id'],
                      //       serviceName: e['packageCategoryName'],
                      //     ),
                      //   ),
                      // );
                    },
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${Constant.baseUrl}/ga-attribute/servicePackageCategories/${e!.id}/${e.packagePicUrl}",
                              height: 40,
                              width: 40,
                              progressIndicatorBuilder:
                                  (context, url, progress) {
                                return CircleAvatar(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: progress.progress,
                                ));
                              },
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Text(
                            "${e.packageCategoryName}",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          );
  }
}
