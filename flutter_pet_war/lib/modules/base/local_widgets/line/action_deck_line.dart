import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/utils/game_utils.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/modules/base/controllers/base_game_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/base_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/empty_card.dart';
import 'package:get/get.dart';

class ActionDeckLine<T extends BaseGameController> extends GetView<T> {
  final int line;
  const ActionDeckLine({super.key, this.line = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  text: Constant.CANVAS_TEXT[0][i],
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
                text: Constant.DECK_TEXT[1],
                size: 0,
                isPet: false,
              ),
            ),
          ],
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: !controller.initActionDeckFinish()
                ? []
                : [
                    const SizedBox(width: 25),
                    SizedBox(
                      width: (Constant.CARD_WIDTH + 7) * 6 + 10 * 6,
                      height: Constant.CARD_HEIGHT + 35,
                      child: Obx(
                        () => ReorderableListView(
                          buildDefaultDragHandles:
                              false, //controller.isMovingAim(),
                          scrollDirection: Axis.horizontal,
                          onReorder: controller.onReorderAim,
                          children: [
                            ...controller.actionUp().asMap().entries.map(
                              (e) {
                                var emptyCard = EmptyCardV2(
                                  text: Constant.CANVAS_TEXT[line][e.key],
                                );
                                ActionModel? action;
                                Widget? actionCard;
                                if (e.value != null) {
                                  action = ActionModel.fromJson(e.value!);
                                  actionCard = ActionCard(action: action);
                                }
                                if (action == null &&
                                    controller.aimList[e.key] != null) {
                                  action = ActionModel(
                                      id: "", name: "", ability: "", block: 2);
                                  actionCard = Visibility(
                                    visible: false,
                                    maintainState: true,
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    child: ActionCard(action: action),
                                  );
                                }
                                return Padding(
                                  key: ValueKey(Constant.CANVAS_TEXT[line]
                                          [e.key] +
                                      (line + e.key).toString()),
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BaseCard<Map<String, dynamic>>(
                                        // key: ValueKey(Constant.CANVAS_TEXT[line][e.key] +
                                        //     (line + e.key).toString()),
                                        data: e.value,
                                        type: action != null //e.value != null
                                            ? GameUtils.onActionDeckTypeCard(
                                                controller, e.key)
                                            : GameUtils
                                                .onActionDeckTypeCardEmpty(
                                                    controller, e.key),
                                        onAcceptWithDetails: (details) async {
                                          print("ActionDeckLine onAccept");
                                          controller.sendCommand(
                                            details.data,
                                            extraprop: {
                                              "index": e.key,
                                              "line": line,
                                            },
                                          );
                                        },
                                        showCondition:
                                            controller.aimList[e.key] != null,
                                        // controller.actionUp[e.key] != null,
                                        emptyChild: emptyCard,
                                        child: actionCard ?? emptyCard,
                                      ),
                                      if (controller.isMovingAim() &&
                                          e.value != null)
                                        Container(
                                          width: Constant.CARD_WIDTH,
                                          height: 25,
                                          color: Colors.white,
                                          child: ReorderableDragStartListener(
                                            enabled: true,
                                            index: e.key,
                                            child: const Icon(
                                              Icons.drag_handle,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      Visibility(
                                        visible: e.value != null &&
                                            controller.isHaunted(),
                                        maintainSize: true,
                                        maintainAnimation: true,
                                        maintainState: true,
                                        child: SizedBox(
                                          height: 25,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text("Hapus Aim"),
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
                    const SizedBox(width: 40),
                    Visibility(
                      visible: controller.actionDeckLength > 0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Deck(
                            text: Constant.DECK_TEXT[line],
                            size: controller.actionDeckLength(),
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
