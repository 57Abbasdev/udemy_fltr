import 'package:age/age.dart';

class AgeCalculation {

  ///Calculate current Age
  AgeDuration calculateAge(DateTime todayDate, DateTime dobDate) {
    AgeDuration currentAge = Age.dateDifference(
        fromDate: dobDate, toDate: todayDate, includeToDate: false);
    return currentAge;
  }

  //calculate next birth date
  AgeDuration calculateNextBirthDate(DateTime todayDate, DateTime dobDate) {

    //if temp date is before the date of birth then condition will be true
    // and add 1 year to the duration.

    DateTime tempDate = DateTime(todayDate.year, dobDate.month, dobDate.day);
    DateTime nextBirthday = tempDate.isBefore(todayDate)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;
    AgeDuration nextBirthdayDuration =
    Age.dateDifference(fromDate: todayDate, toDate: nextBirthday);

    //_nextBirthday = nextBirthdayDuration;
    return nextBirthdayDuration;
  }

  int calculateWeekDay(DateTime todayDate, DateTime dobDate) {
    DateTime tempDate = DateTime(todayDate.year, dobDate.month, dobDate.day);
    DateTime nextBirthday = tempDate.isBefore(todayDate)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;

    return nextBirthday.weekday;
  }
}
