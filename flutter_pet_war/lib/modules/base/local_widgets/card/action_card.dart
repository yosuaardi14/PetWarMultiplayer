import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';

class ActionCard extends StatelessWidget {
  final ActionModel action;
  final bool playerCard;
  final bool cardBlockDrag;
  final bool useSpecial;
  const ActionCard(
      {super.key,
      required this.action,
      this.playerCard = false,
      this.useSpecial = false,
      this.cardBlockDrag = false});

  @override
  Widget build(BuildContext context) {
    if (action.special != null) {
      return SpecialActionCard(
          action: action,
          playerCard: playerCard,
          useSpecial: action.useSpecial);
    }
    if (action.block == 2 && playerCard == false && cardBlockDrag == false) {
      return Transform.rotate(
        angle: 3.14 / (action.name == "" ? 2 : -2),
        child: Transform.translate(
          offset: const Offset(0, 70),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4,
            child: Container(
              width: Constant.CARD_WIDTH,
              height: Constant.CARD_HEIGHT,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          action.name,
                          style: const TextStyle(
                            fontSize: Constant.ACTION_FONT_SIZE,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Transform.rotate(
      angle: action.block == 2 ? 3.14 / -2 : 0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Container(
          width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
          height:
              playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.CARD_HEIGHT,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      action.name,
                      style: const TextStyle(
                        fontSize: Constant.ACTION_FONT_SIZE,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialActionCard extends StatelessWidget {
  final ActionModel action;
  final bool playerCard;
  final bool useSpecial;

  const SpecialActionCard({
    super.key,
    required this.action,
    required this.playerCard,
    required this.useSpecial,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: useSpecial ? 3.14 : 0.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Container(
          width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
          height:
              playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.CARD_HEIGHT,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      action.name,
                      style: TextStyle(
                        fontSize: playerCard
                            ? Constant.PLAYER_FONT_SIZE
                            : Constant.FONT_SIZE,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        action.special!.name,
                        style: TextStyle(
                          fontSize: playerCard
                              ? Constant.PLAYER_FONT_SIZE
                              : Constant.FONT_SIZE,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
