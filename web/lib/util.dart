import 'dart:convert';
import 'dart:math';
import 'package:web/helpers.dart';
import 'route.dart';
import 'dart:js';

void logout() {
  document.cookie = "username=; Max-Age=0";
  window.alert("You have successfully logout");
  changeContent("login-page");
}

void editReservation() {
  // dapatkan value dalam localStoarage
  var reservations = json.decode(window.localStorage.getItem("reservation")!);

  // daptkan carik reservatrion yang nak diedit

  // edit name, venue, tarikh, duration
  var name1 = context.callMethod('prompt', ['Enter new name:']);
  print(name1);
  reservations["name"] = name1;

  // simpan balik data baru dalam localStoarage

  // alert
  window.alert("You have edited");
  // changeContent("admin-dashboard")
}

//Wafi and Harith Part
bool authenticate() {
  FormData formData =
      FormData(document.querySelector("#login-form") as HTMLFormElement);

  String username = formData.get("username") as String;
  String password = formData.get("password") as String;

// first user - admin
  if (username == "admin" && password == "admin123") {
    window.alert("You are authenticated as admin");
    document.cookie = "username=admin";
    changeContent("home");
    return true;
  }

// second user = wafiy
  if (username == "wafiy" && password == "wafiy123") {
    window.alert("You are authenticated as wafiy!");
    document.cookie = "username=wafiy";
    changeContent("home");
    return true;
  }
  // third user = hakim
  if (username == "hakim" && password == "hakim123") {
    window.alert("You are authenticated as hakim!");
    document.cookie = "username=hakim";
    changeContent("home");
    return true;
  }
  window.alert("Wrong username and password! You are not authenticated!");
  return false;
}

void updateReservation() {}
//Wafi Part
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

  changeContent("admin-dashboard");
}

//Hakim Part
void makeReservation() {
  var rng = Random();
  FormData formData =
      FormData(document.querySelector("#reservation-form") as HTMLFormElement);

  var roomId = formData.get("roomId") as String;
  var name = formData.get("name") as String;
  var reservationDate = formData.get("reservation-date") as String;
  var reservationDuration = formData.get("reservation-duration") as String;

  var reservation = {
    "username": document.cookie,
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

  changeContent("list-venues");
}
