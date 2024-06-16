import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/pet_card.dart';
import 'package:get/get.dart';

class CardListDialog extends StatelessWidget {
  final List<Map<String, dynamic>> cardList;
  const CardListDialog({super.key, required this.cardList});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return AlertDialog(
      title: const Text("Daftar Kartu"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Ok"),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 700,
            height: Constant.CARD_HEIGHT,
            child: Scrollbar(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...cardList.toList().asMap().entries.map((e) {
                      Widget? card;
                      Pet? pet;
                      PetCard? petCard;
                      ActionModel? action;
                      ActionCard? actionCard;
                      if (e.value.containsKey("ability")) {
                        action = ActionModel.fromJson(
                            Map<String, dynamic>.from(e.value));
                        actionCard = ActionCard(action: action);
                        card = actionCard;
                      } else {
                        pet = Pet.fromJson(Map<String, dynamic>.from(e.value));
                        petCard = PetCard(pet: pet);
                        card = petCard;
                      }
                      return card;
                    }),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
