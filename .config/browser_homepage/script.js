// The clock and date
const days = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

function datetime() {
  const today = new Date();

  let hrs = today.getHours(),
    mins = today.getMinutes(),
    day = today.getDay(),
    dd = today.getDate(),
    mm = today.getMonth() + 1,
    yy = today.getFullYear();

  if (mins < 10) mins = "0" + mins;
  if (hrs < 10) hrs = "0" + hrs;

  if (dd < 10) dd = "0" + dd;
  if (mm < 10) mm = "0" + mm;

  document.getElementById("time").innerHTML = hrs + ":" + mins + " ";
  document.getElementById("date").innerHTML =
    days[day] + ", " + dd + "/" + mm + "/" + yy;
  setTimeout(datetime, 1000);
}

datetime();

