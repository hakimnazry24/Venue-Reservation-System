import 'package:web/helpers.dart';
import "dart:js";
import "lib/route.dart";
import "lib/util.dart";
import "package:web/web.dart";

main() {
  if (window.localStorage.getItem("reservation") == null) {
    window.localStorage.setItem("reservation", "[]");
  }
  print(window.localStorage.getItem("reservation"));

  context["changeContent"] = (String page) {
    changeContent(page);
  };

  context["makeReservation"] = makeReservation;
  context["removeReservation"] = removeReservation;
  context["updateReservation"] = updateReservation;
}
