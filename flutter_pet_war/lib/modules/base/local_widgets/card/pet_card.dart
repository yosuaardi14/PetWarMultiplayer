import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final bool playerCard;
  const PetCard({super.key, required this.pet, this.playerCard = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      child: Container(
        width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
        height:
            playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.PET_CARD_HEIGHT,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: GF.colorFromString(pet.color), //Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    pet.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: playerCard
                          ? Constant.PLAYER_FONT_SIZE
                          : Constant.FONT_SIZE,
                      fontWeight: FontWeight.bold,
                      color: pet.name != "Jungle" ? Colors.white : Colors.black,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: pet.name != "Jungle" ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                pet.ranger,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: pet.name != "Jungle" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
