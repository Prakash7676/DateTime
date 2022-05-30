void main() {
  DateTime dt = DateTime.now();
  DateTime birthDate = DateTime(1990, 05, 14, 7, 12, 22);
  print("Current Datetime " + dt.toString());
  print("Birthdate is " + birthDate.toString());
  print("Birthdate Year " + birthDate.year.toString());
  print("Birthdate Month " + birthDate.month.toString());
  print("Birthdate Day " + birthDate.day.toString());
  print("Birthdate Hour " + birthDate.hour.toString());
  print("Birthdate Minutes " + birthDate.minute.toString());
  print("Birthdate Second " + birthDate.second.toString());

  print("${birthDate.year}/${birthDate.month}/${birthDate.day}");

  // Convert String to Date
  String pastDate = "2022-01-01";
  DateTime pastD = DateTime.parse(pastDate);
  print(pastD.year);

  // Methods add and subtract
  birthDate = birthDate.add(Duration(days: 2));
  birthDate = birthDate.subtract(Duration(days: 2));
  print(birthDate);

  // Date Diff of current date and birthdate
  Duration duration = dt.difference(birthDate);
  print("Difference in day: " + duration.inDays.toString());
  print("Difference in hours: " + duration.inHours.toString());
  print("Difference in minutes: " + duration.inMinutes.toString());
  print("Difference in seconds: " + duration.inSeconds.toString());

  if (birthDate.isAfter(dt)) {
    print("Birth date is after current date");
  } else if (birthDate.isBefore(dt)) {
    print("Birthdate is before current date");
  } else if (birthDate.isAtSameMomentAs(dt)) {
    print("Birth Date is in same moment.");
  }
}

// class Database {
//   static const host = "localhost";
//   static const db = "sms";
// }

//  // const : Compile time.
//   //
//   //, final : Runtime
//   const int a = 10 + 11;
//   final datetime = DateTime.now();
//   //const datetime = DateTime.now();