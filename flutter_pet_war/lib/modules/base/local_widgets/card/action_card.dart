import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';

class ActionCard extends StatelessWidget {
  final ActionModel action;
  final bool playerCard;
  final bool cardBlockDrag;
  final bool useSpecial;
  const ActionCard(
      {super.key, required this.action, this.playerCard = false, this.useSpecial = false, this.cardBlockDrag = false});

  @override
  Widget build(BuildContext context) {
    if (action.special != null) {
      return SpecialActionCard(
        action: action,
        playerCard: playerCard,
        useSpecial: action.useSpecial,
      );
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
              // padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.yellow,
              ),
              child: Stack(
                children: [
                  Container(
                    width: Constant.CARD_WIDTH,
                    height: Constant.CARD_HEIGHT,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH) - 35,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                            color: Colors.yellow.shade100,
                          ),
                          child: Text(
                            action.name,
                            style: const TextStyle(
                              fontSize: Constant.ACTION_FONT_SIZE,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      GF.getIconByAbility(action.ability),
                      color: Colors.black,
                      size: 40,
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
          height: playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.CARD_HEIGHT,
          // padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.yellow,
          ),
          child: Stack(
            children: [
              Container(
                width: Constant.CARD_WIDTH,
                height: Constant.CARD_HEIGHT,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: (playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH) - 30,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow.shade100,
                      ),
                      child: Text(
                        action.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: Constant.ACTION_FONT_SIZE,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                    color: Colors.yellow,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  GF.getIconByAbility(action.ability),
                  color: Colors.black,
                  size: 40,
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
          height: playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.CARD_HEIGHT,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Container(
                width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
                height: playerCard ? Constant.PLAYER_CARD_HEIGHT / 2 : Constant.CARD_HEIGHT / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellow,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
                  height: playerCard ? Constant.PLAYER_CARD_HEIGHT / 2 : Constant.CARD_HEIGHT / 2,
                  decoration: BoxDecoration(
                    color: GF.colorFromString(action.special!.color),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: (playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH) - 15,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                        color: Colors.yellow.shade100,
                      ),
                      child: Text(
                        action.name,
                        style: TextStyle(
                          fontSize: playerCard ? Constant.PLAYER_FONT_SIZE : Constant.FONT_SIZE,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Icon(
                        GF.getIconByAbility(action.ability),
                        color: Colors.black,
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
                alignment: Alignment.bottomLeft,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: (playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH) - 10,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black),
                          color: GF.colorFromString(action.special!.color, true),
                        ),
                        child: Text(
                          action.special!.name,
                          style: TextStyle(
                            fontSize: playerCard ? Constant.PLAYER_FONT_SIZE : Constant.FONT_SIZE,
                            fontWeight: FontWeight.bold,
                            color: action.special!.ranger == "Gaoh" ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Icon(
                          GF.getIconByAbility(action.special?.ability),
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
