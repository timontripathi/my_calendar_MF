import 'package:get/get.dart';

enum ETabs {
  all(text: 'All'),
  hrd(text: 'HRD'),
  tech1(text: 'Tech 1'),
  followUp(text: 'Follow up');

  const ETabs({required this.text});

  final String text;
}

class MController extends GetxController {
  var switchValue = 0.obs;
}
