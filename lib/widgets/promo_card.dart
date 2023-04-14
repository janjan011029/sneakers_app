import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Container(
              padding: const EdgeInsets.only(top: 50),
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/air_max.png'),
                fit: BoxFit.fitWidth,
              )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: const [
                  Text(
                    '40%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'OFF',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.black,
                  onPressed: () {},
                  child: const Text(
                    'Shop Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
