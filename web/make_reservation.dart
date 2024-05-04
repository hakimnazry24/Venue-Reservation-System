import 'package:web/helpers.dart';
import "dart:html";
import "dart:js";
import "dart:convert";

main() {
  // display dynamic image and name
  var params = UrlSearchParams(window.location.search);
  String roomId = params.get("room_id")!;

  ImageElement roomImage = querySelector("#room-image") as ImageElement;

  querySelector("#room-id")!.text = "Conference room $roomId";
  roomImage.src = "/images/rooms/room-$roomId.jpg";

  context["makeReservation"] = () {
    FormData formData = FormData(
        document.querySelector("#reservation-form") as HTMLFormElement);

    var name = formData.get("name") as String;
    var reservationDate = formData.get("reservation-date") as String;
    var reservationDuration = formData.get("reservation-duration") as String;

    var reservation = {
      "name": name,
      "reservationDate": reservationDate,
      "reservationDuration": reservationDuration
    };

    var currentReservation =
        json.decode(window.localStorage.getItem("reservation")!);
    var newReservation = [...currentReservation, reservation];

    window.localStorage.setItem("reservation", jsonEncode(newReservation));

    window.alert("Successfully making a reservation");

    window.location.replace("http://localhost:8080/index.html");
  };
}