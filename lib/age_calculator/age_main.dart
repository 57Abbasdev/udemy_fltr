import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:udemy_fltr/age_calculator/age_calculation.dart';
import 'package:udemy_fltr/utils/constants.dart';

class AgeMain extends StatefulWidget {
  const AgeMain({Key? key}) : super(key: key);

  @override
  State<AgeMain> createState() => _AgeMainState();
}

class _AgeMainState extends State<AgeMain> {
  var dobDate = DateTime(1999, 2, 22);
  var todayDate = DateTime.now();

  AgeDuration _currentAge = AgeDuration();
  AgeDuration _nextBirthday = AgeDuration();
  int _nextWeekDay = 0;

  final List<String> _month = [
    "month",
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
    "MAY",
    "JUNE",
    "JULY",
    "AUGUST",
    "SEPTEMBER",
    "OCTOBER",
    "NOVEMBER",
    "DECEMBER"
  ];
  final List<String> weeks = [
    "WEEKS",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY"
  ];

  Future<void> _selectTodayDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: dobDate,
        lastDate: DateTime(2101));

    if (picked != null && picked != todayDate) {
      setState(() {
        todayDate = picked;
        _currentAge = AgeCalculation().calculateAge(todayDate, dobDate);
        _nextBirthday =
            AgeCalculation().calculateNextBirthDate(todayDate, dobDate);
        _nextWeekDay = AgeCalculation().calculateWeekDay(todayDate, dobDate);
      });
    }
  }

  Future<void> _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dobDate,
      firstDate: DateTime(1),
      lastDate: todayDate,
    );

    if (picked != null && picked != dobDate) {
      setState(() {
        dobDate = picked;
        _currentAge = AgeCalculation().calculateAge(todayDate, dobDate);
        _nextBirthday =
            AgeCalculation().calculateNextBirthDate(todayDate, dobDate);
        _nextWeekDay = AgeCalculation().calculateWeekDay(todayDate, dobDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _currentAge = AgeCalculation().calculateAge(todayDate, dobDate);
    _nextBirthday = AgeCalculation().calculateNextBirthDate(todayDate, dobDate);
    _nextWeekDay = AgeCalculation().calculateWeekDay(todayDate, dobDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            sb,
            const Center(
              child: Text(
                "Age Calculator",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
            sb,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Date of Bir",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "${dobDate.day} ${_month[dobDate.month]} ${dobDate.year}",
                        style: const TextStyle(
                            color: AppConstants.kGoldColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _selectDOB(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            sb,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Text(
                        "${todayDate.day} ${_month[todayDate.month]} ${todayDate.year}",
                        style: const TextStyle(
                            color: AppConstants.kGoldColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectTodayDate(context);
                        },
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            sb,
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff333333),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Center(
                                child: Text(
                              "AGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${_currentAge.years}",
                                  style: const TextStyle(
                                      color: AppConstants.kGoldColor,
                                      fontSize: 76,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "  YEARS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                "${_currentAge.months} MONTHS | ${_currentAge.days} DAYS",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 170,
                        color: const Color(0xff999999),
                      ),
                      Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Center(
                                child: Text("Next Birthday",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ))),
                            const Icon(
                              Icons.cake,
                              color: AppConstants.kGoldColor,
                              size: 40,
                            ),
                            Text(weeks[_nextWeekDay],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700)),
                            Text(
                                "${_nextBirthday.months} MONTHS | ${_nextBirthday.days} DAYS",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16)),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    color: const Color(0xff999999),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("SUMMARY",
                        style: TextStyle(
                            color: AppConstants.kGoldColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "YEARS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${_currentAge.years}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "MONTHS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(_currentAge.years * 12) + _currentAge.months}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "WEEKS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(todayDate.difference(dobDate).inDays / 7).floor()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "DAYS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(todayDate.difference(dobDate).inDays).floor()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "HOURS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(todayDate.difference(dobDate).inHours).floor()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "MINUTES",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(todayDate.difference(dobDate).inMinutes).floor()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                  sb,

                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: null,
                child: Text("More"),
                //Todo:
                // Take screen shot only of the card widget
              ),
            )
          ],
        ),
      ),
    );
  }

  final sb = const SizedBox(
    height: 30,
  );
}
