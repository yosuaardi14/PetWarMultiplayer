import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/base_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/empty_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/dialog/card_list_dialog.dart';
import 'package:get/get.dart';

class DiscardPileLine<T extends BaseGameController> extends GetView<T> {
  final int line;
  const DiscardPileLine({super.key, this.line = 2});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  height: Constant.CARD_HEIGHT + 10,
                  color: Colors.white,
                  child: const RotatedBox(
                    quarterTurns: -1,
                    child: Center(
                      child: Text(
                        "ACTION",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // const SizedBox(width: 28),
              for (var i = 0; i < 6; i++) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: EmptyCardV2(
                    text: Constant.CANVAS_TEXT[2][i],
                    isPet: false,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              // const SizedBox(width: 7),
              const SizedBox(width: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Deck(
                  text: Constant.DECK_TEXT[2],
                  size: 0,
                  isPet: false,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !controller.initDiscardPileFinish()
                ? []
                : [
                    const SizedBox(width: 28),
                    ...controller.actionDown().asMap().entries.map(
                      (e) {
                        var emptyCard = EmptyCardV2(
                          text: Constant.CANVAS_TEXT[line][e.key],
                        );
                        ActionModel? action;
                        Widget? actionCard;
                        if (e.value != null) {
                          action = ActionModel.fromJson(e.value!);
                          actionCard = Stack(
                            alignment: Alignment.center,
                            children: [
                              ActionCard(action: action),
                              if (controller.grenadeList()[e.key] != null)
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    "Turn: ${controller.grenadeList()[e.key] ?? 0}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                            ],
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Column(
                            children: [
                              BaseCard<Map<String, dynamic>>(
                                key: ValueKey(Constant.CANVAS_TEXT[line]
                                        [e.key] +
                                    (line + e.key).toString()),
                                data: e.value,
                                type: GameUtils.onDiscardPileLineTypeCard(
                                    controller),
                                onAcceptWithDetails: (details) async {
                                  print("DiscardPileLine onAccept");
                                  controller.sendCommand(
                                    details.data,
                                    extraprop: {
                                      "index": e.key,
                                      "line": line,
                                    },
                                  );
                                },
                                showCondition:
                                    controller.actionDown[e.key] != null,
                                emptyChild: emptyCard,
                                child: actionCard ?? emptyCard,
                              ),
                              const SizedBox(height: 25),
                            ],
                          ),
                        );
                      },
                    ),
                    // const SizedBox(width: 10),
                    const SizedBox(width: 35),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BaseCard<Map<String, dynamic>>(
                          type: GameUtils.onDiscardPileTypeCard(controller),
                          onWillAcceptWithDetails: (details) {
                            return true;
                          },
                          onAcceptWithDetails: (details) async {
                            controller.sendCommand(
                              details.data,
                            );
                          },
                          emptyChild: Stack(
                            alignment: Alignment.center,
                            children: [
                              Deck(
                                text: Constant.DECK_TEXT[line],
                                size: controller.discardPile.length,
                              ),
                              if (controller.discardPile.isNotEmpty)
                                Container(
                                  color: Colors.black,
                                  child: Text(
                                    "Total: ${controller.discardPile.length}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                            ],
                          ),
                          showCondition:
                              controller.discardPileCurrentCard.isNotEmpty,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              controller.discardPileCurrentCard.isNotEmpty
                                  ? ActionCard(
                                      useSpecial:
                                          controller.discardPileCurrentCard()[
                                                  "useSpecial"] ??
                                              false,
                                      action: ActionModel.fromJson(
                                        controller.discardPileCurrentCard(),
                                      ),
                                    )
                                  : Deck(
                                      text: Constant.DECK_TEXT[line],
                                      size: controller.discardPile.length,
                                    ),
                              if (controller.discardPile.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    "Total: ${controller.discardPile.length}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.discardPile.length > 1,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.dialog(CardListDialog(
                                  cardList: controller
                                      .discardPile()
                                      .reversed
                                      .toList(),
                                ));
                              },
                              child: const Text("Lihat Kartu"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}
