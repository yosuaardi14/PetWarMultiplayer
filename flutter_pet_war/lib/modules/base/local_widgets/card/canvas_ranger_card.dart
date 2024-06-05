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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: GF.colorFromString(canvasRanger.color), //Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    canvasRanger.name,
                    style: TextStyle(
                      fontSize: playerCard
                          ? Constant.PLAYER_FONT_SIZE
                          : Constant.FONT_SIZE,
                      fontWeight: FontWeight.bold,
                      color: Colors.white /*Colors.black*/,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.white /*Colors.black*/,
                  ),
                ],
              ),
            ),
            if (canvasRanger.description.isNotEmpty)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    canvasRanger.description,
                    style: TextStyle(
                      fontSize: playerCard
                          ? Constant.PLAYER_FONT_SIZE
                          : Constant.FONT_SIZE,
                      color: Colors.white /*Colors.black*/,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
