import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/pet_card.dart';
import 'package:get/get.dart';

class MasterHideDialog extends StatelessWidget {
  final int index;
  final bool onGetCover;
  final List<List<Map<String, dynamic>>> cardList;
  const MasterHideDialog({super.key, required this.cardList, required this.index, this.onGetCover = false});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Daftar Kartu untuk ${(onGetCover) ? "Get Cover" : "Master Hide"}"),
          IconButton(
            onPressed: () {
              Get.back(result: -1);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Constant.CARD_WIDTH * 6 + 10,
            height: Constant.CARD_HEIGHT + 100,
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
                      if (e.value[0].containsKey("ability")) {
                        action = ActionModel.fromJson(Map<String, dynamic>.from(e.value[0]));
                        actionCard = ActionCard(action: action);
                        card = actionCard;
                      } else {
                        pet = Pet.fromJson(Map<String, dynamic>.from(e.value[0]));
                        petCard = PetCard(pet: pet);
                        card = petCard;
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          card,
                          Text("Jumlah: ${e.value.length}"),
                          if (e.key == index) const Icon(Icons.arrow_upward),
                          if (!onGetCover && e.value[0]["name"] != "Forest" && e.key != index)
                            ElevatedButton(
                              onPressed: () {
                                Get.back(result: e.key);
                              },
                              child: const Text("Pilih"),
                            ),
                          if (onGetCover &&
                              e.value[0]["name"] != "Forest" &&
                              e.key != index &&
                              (e.key == index + 1 || e.key == index - 1))
                            ElevatedButton(
                              onPressed: () {
                                Get.back(result: e.key);
                              },
                              child: const Text("Pilih"),
                            ),
                        ],
                      );
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
