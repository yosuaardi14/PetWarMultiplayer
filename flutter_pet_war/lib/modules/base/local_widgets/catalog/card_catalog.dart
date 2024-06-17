import 'package:flutter/material.dart';
import 'package:flutter_pet_war/core/values/constant.dart';
import 'package:flutter_pet_war/data/models/card/action.dart';
import 'package:flutter_pet_war/data/models/card/canvas_ranger.dart';
import 'package:flutter_pet_war/data/models/card/pet.dart';
import 'package:flutter_pet_war/modules/base/controllers/card_catalog_controller.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/action_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/canvas_ranger_card.dart';
import 'package:flutter_pet_war/modules/base/local_widgets/card/pet_card.dart';
import 'package:get/get.dart';

class CardCatalog extends StatelessWidget {
  const CardCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CardCatalogController());
    ScrollController scrollController = ScrollController();
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Katalog Kartu"),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      content: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Get.width - 200,
                  height: Get.height - 200,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: Constant.CARD_WIDTH + 10,
                        mainAxisExtent: Constant.CARD_HEIGHT,
                      ),
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      children: [
                        ...Constant.CANVAS_RANGER.map((e) {
                          Map<String, dynamic> data =
                              Map<String, dynamic>.from(e);
                          Widget? card;
                          CanvasRanger? canvasRanger;
                          CanvasRangerCard? canvasRangerCard;
                          canvasRanger = CanvasRanger.fromJson(data);
                          canvasRangerCard = CanvasRangerCard(
                            canvasRanger: canvasRanger,
                          );
                          card = canvasRangerCard;
                          return GestureDetector(
                            onTap: () {
                              controller.showDetail(data);
                            },
                            child: card,
                          );
                        }),
                        ...Constant.PET.entries.map((e) {
                          Map<String, dynamic> data =
                              Map<String, dynamic>.from(e.value);
                          Widget? card;
                          Pet? pet;
                          PetCard? petCard;
                          pet = Pet.fromJson(data);
                          petCard = PetCard(pet: pet);
                          card = petCard;
                          return GestureDetector(
                            onTap: () {
                              controller.showDetail(data);
                            },
                            child: card,
                          );
                        }),
                        ...Constant.ACTION.entries.map((e) {
                          Map<String, dynamic> data =
                              Map<String, dynamic>.from(e.value);
                          if (data.containsKey("block")) {
                            data["block"] = 1;
                          }
                          Widget? card;
                          ActionModel? action;
                          ActionCard? actionCard;
                          action = ActionModel.fromJson(data);
                          actionCard = ActionCard(action: action);
                          card = actionCard;
                          return GestureDetector(
                            onTap: () {
                              controller.showDetail(data);
                            },
                            child: card,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.selectedCard.isNotEmpty
                      ? [
                          if (controller
                              .selectedCard()
                              .containsKey("ability")) ...[
                            ActionCard(
                              action: ActionModel.fromJson(
                                controller.selectedCard(),
                              ),
                            ),
                            Text(
                                "Jumlah: ${controller.selectedCard()["cardNum"]}"),
                            ListTile(
                              isThreeLine: true,
                              title: Text(controller.selectedCard()["name"]),
                              subtitle: Text(
                                  controller.selectedCard()["description"]),
                            ),
                            if (controller.selectedCard()["special"] != null)
                              ListTile(
                                isThreeLine: true,
                                title: Text(controller.selectedCard()["special"]
                                    ["name"]),
                                subtitle: Text(controller
                                    .selectedCard()["special"]["description"]),
                              ),
                          ],
                          if (controller.selectedCard().containsKey("pet")) ...[
                            CanvasRangerCard(
                              canvasRanger: CanvasRanger.fromJson(
                                controller.selectedCard(),
                              ),
                            ),
                            Text(
                                "Jumlah: ${controller.selectedCard()["cardNum"]}"),
                            ListTile(
                              isThreeLine: true,
                              title: Text(controller.selectedCard()["name"]),
                              subtitle: Text(
                                  controller.selectedCard()["description"]),
                            ),
                          ],
                          if (controller
                              .selectedCard()
                              .containsKey("ranger")) ...[
                            PetCard(
                              pet: Pet.fromJson(
                                controller.selectedCard(),
                              ),
                            ),
                            Text(
                                "Jumlah: ${controller.selectedCard()["cardNum"]}"),
                            ListTile(
                              isThreeLine: true,
                              title: Text(controller.selectedCard()["name"]),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller
                                            .selectedCard()["name"]
                                            .toString()
                                            .contains("Forest") ||
                                        controller
                                            .selectedCard()["name"]
                                            .toString()
                                            .contains("Jungle")
                                    ? [
                                        Text(controller
                                            .selectedCard()["description"]),
                                      ]
                                    : [
                                        Text(
                                            "Ranger: ${controller.selectedCard()["ranger"]}"),
                                        Text(
                                            "Nyawa: ${controller.selectedCard()["life"]}"),
                                      ],
                              ),
                            ),
                          ],
                        ]
                      : [],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
