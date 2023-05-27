import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppHomeLoadingShimmer extends StatelessWidget {
  const AppHomeLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!.withOpacity(0.4),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          for (var x = 0; x <= 6; x++) ...{
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: 150,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 16,
                    padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          }
        ],
      ),
    );
  }
}
