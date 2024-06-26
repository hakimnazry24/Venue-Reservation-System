import 'dart:convert';

import 'package:web/helpers.dart';

void changeContent(String page) {
  var contentDiv = querySelector("#content");
  switch (page) {
    case "home":
      contentDiv?.innerHTML = """
    <div class="flex flex-col gap-3 justify-center items-center mt-20">
    <h1 class="text-blue-600 font-semibold  text-3xl">Welcome to Venue Reservation System</h1>
    <p class="text-slate-500">Start reserving your venue by navigating to <span onclick="changeContent('list-venues')" class="underline slate-700 cursor-pointer font-semibold hover:opacity-80">View Venue</span> tab.</p>
</div>
""";
      break;
//Harith part
    case "user-dashboard":
      List reservations =
          json.decode(window.localStorage.getItem("reservation")!);
      var hakimReservations = reservations
          .where((reservation) => reservation["username"] == "username=hakim");
      var wafiyReservations = reservations
          .where((reservation) => reservation["username"] == "username=wafiy");

      print(wafiyReservations);
      print(hakimReservations);
      // display wafiy dashboard when username is wafiy
      if (document.cookie == "username=wafiy") {
        contentDiv?.innerHTML = '''
        <div class="m-10">
        <h1 class="text-2xl font-semibold mb-5"> User Dashboard for Wafiy </h1>
          <table>
              <thead>
              <tr>
          <th>Reservation ID</th>
          <th>Room number</th>
          <th>Full name</th>
          <th>Reservation date</th>
          <th>Reservation duration</th>
          <th>Option</th>
          </tr>
              </thead>
              <tbody id="wafiy-table-body">
              
              </tbody>
          </table>
        </div>
        ''';
        int index = 0;
        for (var reservation in wafiyReservations) {
          // create row
          var reservationTr = document.createElement("tr");
          reservationTr.className = "reservation-row-$index";

          // create name, room, date and duration table cell
          var reservationIdTd = document.createElement("td");
          var nameTd = document.createElement("td");
          var roomIdTd = document.createElement("td");
          var reservationDateTd = document.createElement("td");
          var reservationDurationTd = document.createElement("td");
          var optionTd = document.createElement("td");

          // assign value from localStorage to variable
          var reservationId = reservation["reservationId"].toString();
          var name = reservation["name"];
          var roomId = "Conference room ${reservation['roomId']}";
          var reservationDate = reservation["reservationDate"];
          var reservationDuration =
              "${reservation["reservationDuration"]} hours";

          // assign value to element
          reservationIdTd.innerHTML = reservationId;
          nameTd.innerHTML = name;
          roomIdTd.innerHTML = roomId;
          reservationDateTd.innerHTML = reservationDate;
          reservationDurationTd.innerHTML = reservationDuration;
          optionTd.innerHTML =
              "<button class='bg-red-500 text-white font-semibold rounded-xl p-2' onclick='removeReservation($reservationId)'>Delete</button>";

          // append row to table

          document
              .querySelector("#wafiy-table-body")!
              .appendChild(reservationTr);

          // append cell to row
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(roomIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(nameTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDateTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDurationTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(optionTd);

          index++;
        }
      }

      // display hakim dashboard when username equals hakim
      else if (document.cookie == "username=hakim") {
        contentDiv?.innerHTML = '''
        <div class="m-10">
        <h1 class="text-2xl font-semibold mb-5"> User Dashboard for Hakim </h1>
          <table>
              <thead>
              <tr>
          <th>Reservation ID</th>
          <th>Room number</th>
          <th>Full name</th>
          <th>Reservation date</th>
          <th>Reservation duration</th>
          <th>Option</th>
          </tr>
              </thead>
              <tbody id="hakim-table-body">
              
              </tbody>
          </table>
        </div>
        ''';
        int index = 0;
        for (var reservation in hakimReservations) {
          // create row
          var reservationTr = document.createElement("tr");
          reservationTr.className = "reservation-row-$index";

          // create name, room, date and duration table cell
          var reservationIdTd = document.createElement("td");
          var nameTd = document.createElement("td");
          var roomIdTd = document.createElement("td");
          var reservationDateTd = document.createElement("td");
          var reservationDurationTd = document.createElement("td");
          var optionTd = document.createElement("td");

          // assign value from localStorage to variable
          var reservationId = reservation["reservationId"].toString();
          var name = reservation["name"];
          var roomId = "Conference room ${reservation['roomId']}";
          var reservationDate = reservation["reservationDate"];
          var reservationDuration =
              "${reservation["reservationDuration"]} hours";

          // assign value to element
          reservationIdTd.innerHTML = reservationId;
          nameTd.innerHTML = name;
          roomIdTd.innerHTML = roomId;
          reservationDateTd.innerHTML = reservationDate;
          reservationDurationTd.innerHTML = reservationDuration;
          optionTd.innerHTML =
              "<button class='bg-red-500 text-white font-semibold rounded-xl p-2' onclick='removeReservation($reservationId)'>Delete</button>";

          // append row to table

          document
              .querySelector("#hakim-table-body")!
              .appendChild(reservationTr);

          // append cell to row
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(roomIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(nameTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDateTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDurationTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(optionTd);

          index++;
        }
      }
      // if not wafiy or hakim, cannot see user dashboar
      else {
        window.alert("You are not user!");
        changeContent("home");
      }

      break;

    case "manage-reservation":
      contentDiv?.innerHTML = '''
  <div>manage reservation</div>

''';
      break;
    //Hakim Part
    case "list-venues":
      contentDiv?.innerHTML = """


    <div class="grid grid-cols-1 md:lg:grid-cols-3 gap-5">
<div class="col-span-5 p-10">
      <h1 class="text-4xl pb-5 text-blue-800">Venues</h1>
      <div class="grid grid-cols-1 md:lg:grid-cols-3 gap-5">


        <!-- room card 1-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-1.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 1</p>
            <form method="get" onsubmit="changeContent('room-1')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="1">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 2-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-2.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 2</p>
            <form method="get" onsubmit="changeContent('room-2')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="2">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 3-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-3.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 3</p>
            <form  method="get" onsubmit="changeContent('room-3')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="3">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 4-->
        <div class="border border-slate-200 shadow-md rounded-lg">
           <img
            src="/images/rooms/room-4.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 4</p>
            <form  method="get" onsubmit="changeContent('room-4')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="4">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 5-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-5.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 5</p>
            <form method="get" onsubmit="changeContent('room-5')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="5">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 6-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-6.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 6</p>
            <form method="get" onsubmit="changeContent('room-6')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="6">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 7-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-7.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 7</p>
            <form  method="get" onsubmit="changeContent('room-7')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="7">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 8-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-8.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 8</p>
            <form  method="get" onsubmit="changeContent('room-8')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="8">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 9-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-9.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 9</p>
            <form method="get" onsubmit="changeContent('room-9')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="9">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 10-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-10.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 10</p>
            <form  method="get" onsubmit="changeContent('room-10')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="10">
                Book
              </button>
            </form>
          </div>
        </div>


         <!-- room card 11-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-11.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 11</p>
            <form  method="get" onsubmit="changeContent('room-11')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="11">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 12-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-12.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 12</p>
            <form method="get" onsubmit="changeContent('room-12')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="12">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 13-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-13.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 13</p>
            <form method="get" onsubmit="changeContent('room-13')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="13">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 14-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-14.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 14</p>
            <form  method="get" onsubmit="changeContent('room-14')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="14">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 15-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-15.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 15</p>
            <form  method="get" onsubmit="changeContent('room-15')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="15">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 16-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-16.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 16</p>
            <form  method="get" onsubmit="changeContent('room-16')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="16">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 17-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-17.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 17</p>
            <form method="get" onsubmit="changeContent('room-17')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="17">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 18-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-18.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 18</p>
            <form  method="get" onsubmit="changeContent('room-18')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="18">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 19-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-19.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 19</p>
            <form method="get" onsubmit="changeContent('room-19')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="19">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 20-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-20.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 20</p>
            <form method="get" onsubmit="changeContent('room-20')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>
        
         <!-- room card 21-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-21.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 21</p>
            <form method="get" onsubmit="changeContent('room-21')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 22-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-22.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 22</p>
            <form method="get" onsubmit="changeContent('room-22')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 23-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-23.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 23</p>
            <form method="get" onsubmit="changeContent('room-23')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 24-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-24.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 24</p>
            <form method="get" onsubmit="changeContent('room-24')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 25-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-25.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 25</p>
            <form method="get" onsubmit="changeContent('room-25')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 26-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-26.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 26</p>
            <form method="get" onsubmit="changeContent('room-26')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 27-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-27.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 27</p>
            <form method="get" onsubmit="changeContent('room-27')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 28-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-28.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 28</p>
            <form method="get" onsubmit="changeContent('room-28')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 29-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-29.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 29</p>
            <form method="get" onsubmit="changeContent('room-29')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>

        <!-- room card 30-->
        <div class="border border-slate-200 shadow-md rounded-lg">
          <img
            src="/images/rooms/room-30.jpg"
            width="300"
            height="300"
            alt=""
            class="w-full h-64 row-span-4"
          />
          <div class="flex justify-between p-3">
            <p class="pt-2 text-lg">Conference Room 30</p>
            <form method="get" onsubmit="changeContent('room-30')">
              <button name="room_id" class="p-1 px-4 rounded-xl text-white bg-blue-600 active:bg-blue-800" value="20">
                Book
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
     

         

         

         
    </div>
""";
      break;
    //Wafi Part
    case "login-page":
      contentDiv?.innerHTML = '''
        <div class="container">
        <form id="login-form" onsubmit="authenticate()">
            <h1 class="text-xl font-semibold mb-5">Login</h1>
            <div class="input-control">
                <label for="username">Username</label>
                <input id="username" name="username" type="text">
                <div class="error"></div>
            </div>

            <div class="input-control">
                <label for="password">Password</label>
                <input id="password" name="password" type="password">
                <div class="error"></div>
            </div>
            
            <button type="submit">Sign Up</button>
        <div>
          <p class="text-slate-300 font-italic">User 1: admin;admin123</p>
          <p class="text-slate-300 font-italic">User 2: hakim;hakim123</p>
          <p class="text-slate-300 font-italic">User 3: wafiy;wafiy123</p>
        </div>
        </form>
    </div>
      ''';
      break;

    case "admin-dashboard":
      if (document.cookie == "username=admin") {
        contentDiv?.innerHTML = '''
  <div class="container">
        <h1 class="font-semibold text-3xl mb-5">Admin View - Venue Reservation System</h1>
        
        
        <section class="reservation-management mt-10">
          <h2 class="font-semibold text-xl mb-5">Reservation Management</h2>
        </section>
        <div class="fixTableHead" id="reservationTable"> 
          <table> 
            <thead> 
              <tr> 
                <th>Username</th>
                <th>Reservation ID</th>
                <th>Room number</th>
                <th>Full name</th>
                <th>Reservation Date</th>
                <th>Reservation Duration</th> 
                <th>Option</th> 
              </tr> 
            </thead> 
        
            <tbody class="reservation-table"> 
              
            </tbody> 
              
          </table> 
        </div> 
    
     </div>

 ''';
        var reservations =
            json.decode(window.localStorage.getItem("reservation")!);
        int index = 0;
        for (var reservation in reservations) {
          // create row
          var reservationTr = document.createElement("tr");
          reservationTr.className = "reservation-row-$index";

          // create name, room, date and duration table cell
          var usernameTd = document.createElement("td");
          var reservationIdTd = document.createElement("td");
          var nameTd = document.createElement("td");
          var roomIdTd = document.createElement("td");
          var reservationDateTd = document.createElement("td");
          var reservationDurationTd = document.createElement("td");
          var optionTd = document.createElement("td");

          // assign value from localStorage to variable
          var username = reservation["username"].toString();
          var reservationId = reservation["reservationId"].toString();
          var name = reservation["name"];
          var roomId = "Conference room ${reservation['roomId']}";
          var reservationDate = reservation["reservationDate"];
          var reservationDuration =
              "${reservation["reservationDuration"]} hours";

          // assign value to element
          usernameTd.innerHTML = username;
          reservationIdTd.innerHTML = reservationId;
          nameTd.innerHTML = name;
          roomIdTd.innerHTML = roomId;
          reservationDateTd.innerHTML = reservationDate;
          reservationDurationTd.innerHTML = reservationDuration;
          optionTd.innerHTML =
              "<button class='bg-red-500 text-white font-semibold rounded-xl p-2' onclick='removeReservation($reservationId)'>Delete</button><button class='bg-red-500 text-white font-semibold rounded-xl p-2' onclick='editReservation()'>Edit</button>";

          // append row to table

          document
              .querySelector(".reservation-table")!
              .appendChild(reservationTr);

          // append cell to row
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(usernameTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(roomIdTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(nameTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDateTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(reservationDurationTd);
          document
              .querySelector(".reservation-row-$index")!
              .appendChild(optionTd);

          index++;
        }
      } else {
        window.alert("You are not username admin");
        changeContent("home");
      }

      break;

    //Hakim part
    case "room-1":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-1.jpg" class="h-64" />
        <p id="room-id">Conference room 1</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
        <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="1"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-2":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-2.jpg" class="h-64" />
        <p id="room-id">Conference room 2</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="2"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-3":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-3.jpg" class="h-64" />
        <p id="room-id">Conference room 3</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="3"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-4":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-4.jpg" class="h-64" />
        <p id="room-id">Conference room 4</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="4"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-5":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-5.jpg" class="h-64" />
        <p id="room-id">Conference room 5</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="5"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-6":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-6.jpg" class="h-64" />
        <p id="room-id">Conference room 6</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="6"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-7":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-7.jpg" class="h-64" />
        <p id="room-id">Conference room 7</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="7"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-8":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-8.jpg" class="h-64" />
        <p id="room-id">Conference room 8</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="8"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-9":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-9.jpg" class="h-64" />
        <p id="room-id">Conference room 9</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="9"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-10":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-10.jpg" class="h-64" />
        <p id="room-id">Conference room 10</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="10"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-11":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-11.jpg" class="h-64" />
        <p id="room-id">Conference room 11</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="11"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-12":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-12.jpg" class="h-64" />
        <p id="room-id">Conference room 12</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="12"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-13":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-13.jpg" class="h-64" />
        <p id="room-id">Conference room 13</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="13"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-14":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-14.jpg" class="h-64" />
        <p id="room-id">Conference room 14</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="14"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-15":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-15.jpg" class="h-64" />
        <p id="room-id">Conference room 15</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="15"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-16":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-16.jpg" class="h-64" />
        <p id="room-id">Conference room 16</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="16"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-17":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-17.jpg" class="h-64" />
        <p id="room-id">Conference room 17</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="17"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-18":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-18.jpg" class="h-64" />
        <p id="room-id">Conference room 18</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="18"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-19":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-19.jpg" class="h-64" />
        <p id="room-id">Conference room 19</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="19"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-20":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-20.jpg" class="h-64" />
        <p id="room-id">Conference room 20</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="20"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;

    case "room-21":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-21.jpg" class="h-64" />
        <p id="room-id">Conference room 21</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="21"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-22":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-22.jpg" class="h-64" />
        <p id="room-id">Conference room 22</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="22"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;

    case "room-23":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-23.jpg" class="h-64" />
        <p id="room-id">Conference room 23</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="23"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-24":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-24.jpg" class="h-64" />
        <p id="room-id">Conference room 24</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="24"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-25":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-25.jpg" class="h-64" />
        <p id="room-id">Conference room 25</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="25"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-26":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-26.jpg" class="h-64" />
        <p id="room-id">Conference room 26</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="26"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-27":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-27.jpg" class="h-64" />
        <p id="room-id">Conference room 27</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="27"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-28":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-28.jpg" class="h-64" />
        <p id="room-id">Conference room 28</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="28"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-29":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-29.jpg" class="h-64" />
        <p id="room-id">Conference room 29</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="29"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    case "room-30":
      contentDiv?.innerHTML = '''
      <div class="col-span-5 p-10">
      <h1 class="text-3xl pb-3 text-blue-800">Make Reservation</h1>
      <div class="flex items-center gap-10 text-3xl">
        <img id="room-image" src="/images/rooms/room-30.jpg" class="h-64" />
        <p id="room-id">Conference room 30</p>
      </div>
      <form
        class="pt-10 text-lg grid grid-cols-3"
        method="get"
        id="reservation-form"
        onsubmit="makeReservation()"
      >
        <div class="flex flex-col gap-4">
          <p>Room number:</p>
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="roomId"
              id="roomId"
              class="p-2 rounded-xl border border-slate-300"
              value="30"
              readonly
            />
          </div>
          <div class="flex flex-col gap-4">
            <input
            required
              type="text"
              name="name"
              id="name"
              placeholder="Your name"
              class="p-2 rounded-xl border border-slate-300"
            />
          </div>
          <div>
            <input required type="date" name="reservation-date" id="reservation-date" />
          </div>
          <div>
            <select name="reservation-duration" id="reservation-duration" required>
              <option value="2">2 hours</option>
              <option value="3">3 hours</option>
              <option value="4">4 hours</option>
            </select>
            <div>
              <button
                type="submit"
                class="p-2 rounded-xl text-white bg-blue-600 mt-10"
              >
                Submit Reservation
              </button>
            </div>
          </div>
        </div>
      </form>
    </div>
''';
      break;
    default:
      contentDiv?.innerHTML = '''
      <div>404 Ooopsiee Page Not Found</div>
''';
      break;
  }
}
