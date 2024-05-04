import 'package:web/helpers.dart';
import "dart:html";
import "dart:js";

main() {
  context["changeContent"] = (String page) {
    changeContent(page);
  };
}

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

    case "user-dashboard":
      contentDiv?.innerHTML = '''
  <div>user dashboard</div>
''';
      break;

    case "manage-reservation":
      contentDiv?.innerHTML = '''
  <div>manage reservation</div>

''';
      break;
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
            <p class="pt-2 text-lg">Conference Room 15/p>
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
        
      </div>
    </div>
    </div>
""";
      break;
    case "login-page":
      contentDiv?.innerHTML = "<h1>login page</h1>";
      break;

    case "admin-dashboard":
      contentDiv?.innerHTML = "<h1>admin dashboard</h1>";
      break;

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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
          <p>Full name:</p>
          <p>Booking date:</p>
          <p>Booking duration:</p>
        </div>
        <div>
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
