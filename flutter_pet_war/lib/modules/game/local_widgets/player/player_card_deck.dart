import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/global_functions.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_firebase_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/base_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class PlayerCardDeck extends GetView<BaseGameFirebaseController> {
  const PlayerCardDeck({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: Constant.PLAYER_CARD_HEIGHT * controller.playerObj().cardDeck().length + 10,
          height: Constant.PLAYER_CARD_HEIGHT + 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: GF.colorFromString(controller.playerObj().ranger["color"]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...controller.playerObj().cardDeck().asMap().entries.map(
                (e) {
                  var action = ActionModel.fromJson(e.value);
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () => BaseCard(
                          data: e.value,
                          onDragStarted: () {
                            controller.onStartDragCard(e.value);
                          },
                          onDraggableCanceled: (p0, p1) {
                            controller.onCanceledDrag();
                          },
                          emptyChild: ActionCard(action: action),
                          type: controller.isFinishGame() || !controller.isPlayerTurn()
                              ? WidgetMode.normal
                              : WidgetMode.draggable,
                          feedback: ActionCard(action: action, cardBlockDrag: true),
                          child: ActionCard(action: action, playerCard: true),
                        ),
                      ),
                      Visibility(
                        visible:
                            action.special != null && (action.special!.ranger == controller.playerObj().rangerName()),
                        //          &&
                        // controller.playerSelectedCard().isEmpty,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.flipCard(e.key);
                          },
                          child: const Text("Flip"),
                        ),
                      ),
                      Visibility(
                        visible: action.name.contains("Two"),
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.rotateCard(e.key);
                          },
                          child: const Text("Putar"),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
