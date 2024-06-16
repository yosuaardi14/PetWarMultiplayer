import 'package:flutter/material.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/base_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/empty_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/pet_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/card_list_dialog.dart';
import 'package:get/get.dart';

class PetDeckLine<T extends BaseGameController> extends GetView<T> {
  final int line;
  const PetDeckLine({super.key, this.line = 1});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(width: 28),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: Constant.CARD_HEIGHT + 10,
                  color: Colors.white,
                  child: const RotatedBox(
                    quarterTurns: -1,
                    child: Center(
                      child: Text(
                        "PET LINE",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              for (var i = 0; i < 6; i++) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: EmptyCardV2(
                    text: Constant.CANVAS_TEXT[1][i],
                    isPet: true,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              // const SizedBox(width: 7),
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Deck(
                  text: Constant.DECK_TEXT[1],
                  size: 0,
                  isPet: true,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !controller.initPetDeckFinish()
                ? []
                : [
                    const SizedBox(width: 25),
                    Obx(
                      () => SizedBox(
                        width: (Constant.CARD_WIDTH + 7) * 6 + 10 * 6,
                        height: controller.isMoveThePet()
                            ? Constant.CARD_HEIGHT + 5 + 35
                            : Constant.CARD_HEIGHT + 5 + 35,
                        child: ReorderableListView(
                          buildDefaultDragHandles: controller.isMoveThePet(),
                          scrollDirection: Axis.horizontal,
                          onReorder: controller.onReorderPet,
                          children: [
                            ...controller.petLine().asMap().entries.map(
                              (e) {
                                var emptyCard = EmptyCardV2(
                                  text: Constant.CANVAS_TEXT[line][e.key],
                                  isPet: true,
                                );

                                Widget? card;
                                Pet? pet;
                                PetCard? petCard;
                                ActionModel? action;
                                ActionCard? actionCard;

                                if (e.value.isNotEmpty) {
                                  if (e.value[0].containsKey("ability")) {
                                    action = ActionModel.fromJson(
                                        Map<String, dynamic>.from(e.value[0]));
                                    actionCard = ActionCard(action: action);
                                    card = actionCard;
                                  } else {
                                    pet = Pet.fromJson(
                                        Map<String, dynamic>.from(e.value[0]));
                                    petCard = PetCard(pet: pet);
                                    card = petCard;
                                  }
                                }
                                return Padding(
                                  key: ValueKey(Constant.CANVAS_TEXT[line]
                                          [e.key] +
                                      (line + e.key).toString()),
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  child: Column(
                                    // key: ValueKey(Constant.CANVAS_TEXT[line][e.key] +
                                    //     (line + e.key).toString()),
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BaseCard<Map<String, dynamic>>(
                                        // key: ValueKey(Constant.CANVAS_TEXT[line]
                                        //         [e.key] +
                                        //     (line + e.key).toString()),
                                        type: GameUtils.onPetLineTypeCard(
                                            controller, e.key),
                                        onAcceptWithDetails: (details) async {
                                          controller.sendCommand(
                                            details.data,
                                            extraprop: {
                                              "index": e.key,
                                              "line": line,
                                            },
                                          );
                                        },
                                        emptyChild: card ?? emptyCard,
                                        child: card ?? emptyCard,
                                      ),
                                      if (controller.isMoveThePet())
                                        Container(
                                          width: Constant.CARD_WIDTH,
                                          height: 25,
                                          color: Colors.white,
                                        )
                                      else
                                        Visibility(
                                          visible: e.value.isNotEmpty &&
                                              e.value.length > 1 &&
                                              !controller.isMoveThePet(),
                                          maintainSize: true,
                                          maintainAnimation: true,
                                          maintainState: true,
                                          child: SizedBox(
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.dialog(CardListDialog(
                                                  cardList: e.value,
                                                ));
                                              },
                                              child: const Text("Lihat Kartu"),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(width: 10),
                    const SizedBox(width: 40),
                    if (controller.initPetDeckFinish())
                      Obx(
                        () => Visibility(
                          visible: controller.petDeckLength() -
                                  controller.petLine.length >
                              0,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Deck(
                                text: Constant.DECK_TEXT[line],
                                isPet: true,
                                size: controller.petDeckLength() -
                                    controller.petLine.length,
                              ),
                              const SizedBox(height: 30),
                            ],
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
