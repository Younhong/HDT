class WeeklyTimes {
  static final supportedLocales = const ['ko', 'en'];

  static final dates = {
    "ko": <String>['', '월', '화', '수', '목', '금'],
    "en": <String>['', 'MON', 'TUE', 'WED', 'THU', 'FRI'],
  };

  static final times = {
    "ko": <String>[
      '',
      '1교시',
      '2교시',
      '3교시',
      '4교시',
      '5교시',
      '6교시',
      '7교시',
      '8교시',
      '9교시',
      '10교시',
    ],
    "en": <String>[
      '',
      'AM 1',
      'AM 2',
      'AM 3',
      'AM 4',
      'AM 5',
      'AM 6',
      'AM 7',
      'AM 8',
      'AM 9',
      'AM 10',
    ],
  };

  static bool localContains(String locale) => supportedLocales.contains(locale);
}
