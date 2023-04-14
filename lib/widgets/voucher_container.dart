import 'package:flutter/material.dart';

class VoucherContainer extends StatelessWidget {
  const VoucherContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: double.infinity,
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      '40%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'OFF',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'First Dry Cleaning',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.black45,
                    onPressed: () {},
                    child: const Text(
                      'Use Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Container(
                padding: const EdgeInsets.only(top: 50),
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/air_max.png'),
                  fit: BoxFit.fitHeight,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
