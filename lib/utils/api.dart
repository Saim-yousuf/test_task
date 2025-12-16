enum Environment { local, live }

class Api {
  static final Api instance = Api._();

  Api._();

  static const _localBaseUrl = "http://192.168.100.29:8002";

  static const _liveBaseUrl = "https://backend-mobile.walletric.com";

  static late String baseUrl;

  static void init(Environment env) {
    switch (env) {
      case Environment.local:
        baseUrl = _localBaseUrl;

        break;
      case Environment.live:
        baseUrl = _liveBaseUrl;

        break;
    }
  }

  static final auth = Auth();
}

class Auth {
  String get signin => "${Api.baseUrl}/login/";
  String get signup => "${Api.baseUrl}/sign-up/";
  String get socialAuth => "${Api.baseUrl}/social_auth/";
  String get forgot => "${Api.baseUrl}/otp/generate/";
  String get otpVerify => "${Api.baseUrl}/otp/verify/";
  String get password => "${Api.baseUrl}/otp/password/";
  String get profile => "${Api.baseUrl}/profile/";
  String get logout => "${Api.baseUrl}/logout/";
  String get userDelete => "${Api.baseUrl}/user_delete/";
  String get dashboard => "${Api.baseUrl}/dashboard/";
  String get currency => "${Api.baseUrl}/currency/";
  String get globalCurrency => "${Api.baseUrl}/currency/global-list/";
  String get currencyConvert => "${Api.baseUrl}/currency/convert/";
  String get currencyLedger => "${Api.baseUrl}/currency/currency-ledger/";
  String get transaction => "${Api.baseUrl}/transaction/";
  String get party => "${Api.baseUrl}/party/";
  String get partyAccount => "${Api.baseUrl}/party/account/";
  String get partySubAccount => "${Api.baseUrl}/party/subaccount/";
  String get voucher => "${Api.baseUrl}/voucher/";
  String get voucherReport => "${Api.baseUrl}/voucher/report/";
  String get voucherType => "${Api.baseUrl}/voucher/type/";
  String get notifications =>
      "${Api.baseUrl}/notifications/user-notifications/";
  String get notificationsToggle => "${Api.baseUrl}/notifications/toggle/";
  String get balanceSheet => "${Api.baseUrl}/reports/balance-sheet/";
  String get trialBalance => "${Api.baseUrl}/reports/trial-balance/";
  String get incomeStatement => "${Api.baseUrl}/reports/income-statement/";
  String get currencyAdd => "${Api.baseUrl}/currency/add/";
  String get changeBase => "${Api.baseUrl}/change_base";
}
