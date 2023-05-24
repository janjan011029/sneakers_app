import 'package:flutter/material.dart';
import 'package:sneakers_app/widgets/rounded_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ItemDetails extends StatefulWidget {
  final String title;
  const ItemDetails({super.key, required this.title});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  final List sizes = [6, 7, 8, 9, 10, 11];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _renderImage(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _renderRating(context),
                      const SizedBox(height: 5),
                      _renderDescription(context),
                      const SizedBox(height: 10),
                      _renderPickColor(context),
                      const SizedBox(height: 10),
                      _renderSizePicker(context),
                    ],
                  ),
                ),
              ],
            ),
            _renderTotal(context),
          ],
        ),
      ),
    );
  }

  Column _renderRating(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            for (var x = 0; x <= 3; x++)
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
          ],
        ),
      ],
    );
  }

  Padding _renderTotal(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.bodyMedium),
              Text(
                '\$99',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RoundedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(_snackbar());
                },
                title: "Add to Cart",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SnackBar _snackbar() {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      showCloseIcon: false,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: Colors.green,
        title: 'Successfully Added!',
        message: 'Nike Air Max Pulse is now added to cart',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );
  }

  Hero _renderImage() {
    return Hero(
      tag: 'sample',
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: const DecorationImage(
            image: AssetImage('assets/air_max.png'),
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }

  Column _renderSizePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(2),
            shrinkWrap: true,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              if (sizes.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(sizes[index].toString(),
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                );
              }

              return const Text('No Data');
            },
          ),
        )

        //     Padding(
        //       padding: const EdgeInsets.all(3.0),
        //       child: Container(
        //         height: 50,
        //         width: 50,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           border: Border.all(),
        //           color: Colors.black,
        //         ),
        //         child: Center(
        //           child: Text(
        //             '33',
        //             style: Theme.of(context)
        //                 .textTheme
        //                 .bodyMedium
        //                 ?.copyWith(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
      ],
    );
  }

  Column _renderPickColor(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick Color',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.blue),
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _renderDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 5),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
