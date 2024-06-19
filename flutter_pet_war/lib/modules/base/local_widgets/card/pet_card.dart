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
    if (pet.name == "Menejeur") {
      return SpecialPetCard(pet: pet, playerCard: playerCard);
    }
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      elevation: 5,
      child: Container(
        width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
        height:
            playerCard ? Constant.PLAYER_CARD_HEIGHT : Constant.PET_CARD_HEIGHT,
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: GF.colorFromString(pet.color), //Colors.white,
        ),
        child: Stack(
          children: [
            Container(
              width: Constant.CARD_WIDTH,
              height: Constant.CARD_HEIGHT,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: GF.colorFromString(pet.color),
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Column(
                  children: [
                    Container(
                      width: Constant.CARD_WIDTH - 50,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black),
                        color: GF.colorFromString(pet.color, true),
                      ),
                      child: Text(
                        pet.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: playerCard
                              ? Constant.PLAYER_FONT_SIZE
                              : Constant.FONT_SIZE,
                          fontWeight: FontWeight.bold,
                          color: pet.name == "Vao" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor: GF.colorFromString(pet.color),
                  child: Text(
                    pet.name != "Jungle" ? "I" : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: pet.name != "Jungle" ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.black),
                ),
                child: CircleAvatar(
                  backgroundColor: GF.colorFromString(pet.color),
                  child: Text(
                    pet.ranger,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: pet.name != "Jungle" ? Colors.white : Colors.black,
                    ),
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

class SpecialPetCard extends StatelessWidget {
  final Pet pet;
  final bool playerCard;
  const SpecialPetCard({super.key, required this.pet, this.playerCard = false});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pet.life == 1 ? 3.14 : 0.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        elevation: 5,
        child: Container(
          width: playerCard ? Constant.PLAYER_CARD_WIDTH : Constant.CARD_WIDTH,
          height: playerCard
              ? Constant.PLAYER_CARD_HEIGHT
              : Constant.PET_CARD_HEIGHT,
          // padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: GF.colorFromString(pet.color), //Colors.white,
          ),
          child: Stack(
            children: [
              Container(
                width: playerCard
                    ? Constant.PLAYER_CARD_WIDTH
                    : Constant.CARD_WIDTH,
                height: playerCard
                    ? Constant.PLAYER_CARD_HEIGHT / 2
                    : Constant.CARD_HEIGHT / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: GF.colorFromString(pet.color),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: playerCard
                      ? Constant.PLAYER_CARD_WIDTH
                      : Constant.CARD_WIDTH,
                  height: playerCard
                      ? Constant.PLAYER_CARD_HEIGHT / 2
                      : Constant.CARD_HEIGHT / 2,
                  decoration: BoxDecoration(
                    color: GF.colorFromString(pet.color),
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
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Column(
                    children: [
                      Container(
                        width: Constant.CARD_WIDTH - 50,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black),
                          color: GF.colorFromString(pet.color),
                        ),
                        child: Text(
                          pet.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: playerCard
                                ? Constant.PLAYER_FONT_SIZE
                                : Constant.FONT_SIZE,
                            fontWeight: FontWeight.bold,
                            color: pet.name != "Jungle"
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: GF.colorFromString(pet.color),
                    child: Text(
                      pet.name == "Menejeur" ? "II" : "I",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            pet.name != "Jungle" ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Column(
                      children: [
                        Container(
                          width: Constant.CARD_WIDTH - 50,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                            color: GF.colorFromString(pet.color),
                          ),
                          child: Transform.flip(
                            flipX: false,
                            child: Text(
                              pet.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: playerCard
                                    ? Constant.PLAYER_FONT_SIZE
                                    : Constant.FONT_SIZE,
                                fontWeight: FontWeight.bold,
                                color: pet.name != "Jungle"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black),
                    ),
                    child: CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: GF.colorFromString(pet.color),
                      child: Text(
                        pet.name != "Menejeur" ? "II" : "I",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: pet.name != "Jungle"
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: CircleAvatar(
                    backgroundColor: GF.colorFromString(pet.color),
                    child: Text(
                      pet.ranger,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            pet.name != "Jungle" ? Colors.white : Colors.black,
                      ),
                    ),
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
