import 'package:get/get.dart';

class CardCatalogController extends GetxController {
  final selectedCard = <String, dynamic>{}.obs;

  void showDetail(Map<String, dynamic> data) {
    selectedCard(data);
  }
}
