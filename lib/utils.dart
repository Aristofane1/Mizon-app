import 'package:intl/intl.dart';

List<String> dateList() {
  // Obtenir le jour actuel
  var now = DateTime.now();

  // Générer la liste des jours de la semaine à partir du jour actuel
  List<String> weekDays = [];
  for (int i = 0; i < 7; i++) {
    var date = now.add(Duration(days: i));
    weekDays.add(DateFormat('E d MMM', 'fr_FR').format(date));
  }

  return weekDays;
}

 List<Map> moving_vehicles = [
  {'name': 'moto', 'icon': "assets/images/healthicons_cross-country-motorcycle.svg"},
  {'name': 'car', 'icon': "assets/images/bi_car-front-fill.svg"},
  {'name': 'bus', 'icon': "assets/images/ic_baseline-directions-bus-filled.svg"},
  {'name': 'bike', 'icon': "assets/images/fi-sr-bike.svg"},
  {'name': 'rhombus', 'icon': "assets/images/fi-sr-rhombus.svg"},
];
