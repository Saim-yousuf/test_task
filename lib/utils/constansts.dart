class Constants {
  static const String currencyIcon = "\$";
  static List<String> paymentType = [
    'Cash',
    'Credit',
  ];
  static List<Map> dueDateList = [
    {
      'name': "Within 7 Days",
      'value': 7,
    },
    {
      'name': "Within 15 Days",
      'value': 15,
    },
    {
      'name': "Within 30 Days",
      'value': 30,
    },
  ];
}

enum ReportsType {
  balanceSheet,
  trialBalance,
  profitandloss,
}
