import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingShimmer extends StatelessWidget {
  const AppLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[300]!.withOpacity(0.4),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == 0
                ? const EdgeInsets.only(top: 16, bottom: 8)
                : const EdgeInsets.only(top: 8, bottom: 16),
            child: ListTile(
              leading: const CircleAvatar(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 8,
                    width: MediaQuery.of(context).size.width / 4,
                    padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 16,
                    padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
