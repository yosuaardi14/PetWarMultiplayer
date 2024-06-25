import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';

class EmptyCard extends StatelessWidget {
  final String text;
  final bool isPet;
  const EmptyCard({
    super.key,
    required this.text,
    this.isPet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      child: Container(
        width: Constant.CARD_WIDTH,
        height: isPet ? Constant.PET_CARD_HEIGHT : Constant.CARD_HEIGHT,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isPet ? Colors.greenAccent : Colors.yellowAccent,
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Divider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyCardV2 extends StatelessWidget {
  final String text;
  final bool isPet;
  const EmptyCardV2({
    super.key,
    required this.text,
    this.isPet = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        width: Constant.CARD_WIDTH,
        height: isPet ? Constant.PET_CARD_HEIGHT : Constant.CARD_HEIGHT,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
          color: isPet ? Colors.greenAccent.withOpacity(0.0) : Colors.yellowAccent.withOpacity(0.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // border: const Border.symmetric(
                  // horizontal: BorderSide(color: Colors.white, width: 10),
                  // vertical: BorderSide(color: Colors.white, width: 10),
                  // ),
                  color: isPet ? Colors.greenAccent.withOpacity(0.9) : Colors.yellowAccent.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Divider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Deck extends StatelessWidget {
  final String text;
  final bool isPet;
  final int size;
  const Deck({
    super.key,
    required this.text,
    this.isPet = false,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (size > 0) {
      return BackCard(isPet: isPet, size: size);
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: size > 0 ? (4 + size.toDouble() * 2) : 4,
      child: Container(
        width: Constant.CARD_WIDTH,
        height: isPet ? Constant.PET_CARD_HEIGHT : Constant.CARD_HEIGHT,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isPet ? Colors.greenAccent : Colors.yellowAccent,
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Divider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: VerticalDivider(
                color: Colors.white,
                thickness: 3,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  final bool isPet;
  final int size;
  const BackCard({super.key, required this.isPet, required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: (4 + size.toDouble() * 2),
      child: Container(
        width: Constant.CARD_WIDTH,
        height: Constant.CARD_HEIGHT,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isPet ? Colors.greenAccent : Colors.yellowAccent,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: Colors.white, width: 10),
                    vertical: BorderSide(color: Colors.white, width: 10),
                  ),
                  borderRadius: BorderRadius.circular(75),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "PET\nWAR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Total: $size",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO
// class FrontCard extends StatelessWidget {
//   final bool isPet;
//   final int size;
//   const FrontCard({super.key, required this.isPet, required this.size});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       elevation: 4,
//       child: Container(
//         width: Constant.CARD_WIDTH,
//         height: Constant.CARD_HEIGHT,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: isPet ? Colors.greenAccent : Colors.yellowAccent,
//         ),
//         child: Stack(
//           children: [
//             const Align(
//               alignment: Alignment.center,
//               child: Divider(
//                 color: Colors.white,
//                 thickness: 3,
//               ),
//             ),
//             const Align(
//               alignment: Alignment.center,
//               child: VerticalDivider(
//                 color: Colors.white,
//                 thickness: 3,
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   border: const Border.symmetric(
//                     horizontal: BorderSide(color: Colors.white, width: 10),
//                     vertical: BorderSide(color: Colors.white, width: 10),
//                   ),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: const Border.symmetric(
//                     horizontal: BorderSide(color: Colors.white, width: 10),
//                     vertical: BorderSide(color: Colors.white, width: 10),
//                   ),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//               ),
//             ),
//             const Align(
//               alignment: Alignment.center,
//               child: Text(
//                 "PET\nWAR",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 "Total: $size",
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
