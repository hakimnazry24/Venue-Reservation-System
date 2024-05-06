import 'dart:convert';
import 'dart:math';
import 'package:web/helpers.dart';

void updateReservation() {}

void removeReservation(int reservationId) {
  List reservations = json.decode(window.localStorage.getItem("reservation")!);

  Map reservationToBeRemoved = {};
  for (var reservation in reservations) {
    if (reservation["reservationId"].toString() == reservationId.toString()) {
      reservationToBeRemoved = reservation;
      break;
    }
  }
  print(reservationToBeRemoved);
  reservations.remove(reservationToBeRemoved);
  // print(reservations);
  window.localStorage.setItem("reservation", json.encode(reservations));
  window.alert("Successfully removing Reservation ID: $reservationId");

  window.location.replace("http://localhost:8080/index.html");
}

void makeReservation() {
  var rng = Random();
  FormData formData =
      FormData(document.querySelector("#reservation-form") as HTMLFormElement);

  var roomId = formData.get("roomId") as String;
  var name = formData.get("name") as String;
  var reservationDate = formData.get("reservation-date") as String;
  var reservationDuration = formData.get("reservation-duration") as String;

  var reservation = {
    "reservationId": rng.nextInt(1000000),
    "name": name,
    "roomId": roomId,
    // "reservationTime": reservationTime.
    "reservationDate": reservationDate,
    "reservationDuration": reservationDuration
  };

  var currentReservation =
      json.decode(window.localStorage.getItem("reservation")!);
  var newReservation = [...currentReservation, reservation];

  window.localStorage.setItem("reservation", jsonEncode(newReservation));

  window.alert("Successfully making a reservation");

  window.location.replace("http://localhost:8080/index.html");
}
