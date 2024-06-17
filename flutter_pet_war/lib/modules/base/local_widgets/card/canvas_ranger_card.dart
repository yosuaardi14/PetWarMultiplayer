import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/canvas_ranger.dart';

class CanvasRangerCard extends StatelessWidget {
  final CanvasRanger canvasRanger;
  final bool playerCard;
  const CanvasRangerCard({
    super.key,
    required this.canvasRanger,
    this.playerCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      child: Container(
        width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
        height: playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.CARD_HEIGHT,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Container(
            //     width: 35,
            //     height: 35,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       border: Border.all(color: Colors.black),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VerticalDivider(
                    width: 1,
                    thickness: 5,
                    color: GF.colorFromString(canvasRanger.color),
                  ),
                  VerticalDivider(
                    width: 13,
                    thickness: 2,
                    color: GF.colorFromString(canvasRanger.color),
                  ),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: GF.colorFromString(canvasRanger.color),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: playerCard
                    ? Constant.PLAYER_CARD_WIDTH
                    : Constant.CARD_WIDTH,
                height: 30,
                decoration: BoxDecoration(
                  color: GF.colorFromString(canvasRanger.color),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Container(
                  width: (playerCard
                          ? Constant.PLAYER_CARD_WIDTH
                          : Constant.CARD_WIDTH) -
                      20,
                  height: 35,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: GF.colorFromString(canvasRanger.color, true),
                  ),
                  child: Text(
                    "",
                    // canvasRanger.description,
                    style: TextStyle(
                      fontSize: playerCard
                          ? Constant.PLAYER_FONT_SIZE
                          : Constant.FONT_SIZE,
                      color: Colors.white /*Colors.black*/,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: GF.colorFromString(canvasRanger.color, true),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  canvasRanger.pet,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color:
                        canvasRanger.pet == "Vao" ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 25),
                    child: Text(
                      canvasRanger.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: playerCard
                            ? Constant.PLAYER_FONT_SIZE
                            : Constant.FONT_SIZE,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        // shadows: [
                        // Shadow(color: Colors.white, offset: Offset(0.5, 0.5),)
                        // ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 12,
                    thickness: 2,
                    color: Colors.black,
                    endIndent: 20,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 4,
                    color: Colors.black,
                    endIndent: 35,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
