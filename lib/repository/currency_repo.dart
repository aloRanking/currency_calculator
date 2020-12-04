import 'package:currencycalculator/models/currency_converter.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  Dio _dio = Dio();

  final String ApiKey = "858cb67174af02eae776f7b6e15353f4";

  String _baseUrl = "https://api.exchangeratesapi.io/latest";
  String _baseUrl2 = "http://data.fixer.io/api/latest";

  Future<CurrencyConvert> currencyXchange(
      String currency1, String currency2) async {
    Response response = await _dio.get(_baseUrl,
        queryParameters: {'base': currency1, 'symbols': currency2});

    try {
      return CurrencyConvert.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response == null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  Future<CurrencyConvert> currencyXchange2(String currency1,
      String currency2) async {
    Response response = await _dio.get(_baseUrl2,
        queryParameters: {
          'access_key': ApiKey,
          'base': currency1,
          'symbols': currency2,
        });

    try {
      return CurrencyConvert.fromJson(response.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response == null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  List<double> EURtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    List<double> resultNDrates = [];
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double NGNrate = exchangeRate.rates.nGN;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      resultNDrates.add(CADrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      resultNDrates.add(CHFrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      resultNDrates.add(NGNrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      resultNDrates.add(USDrate);
      resultNDrates.add(result);
      return resultNDrates;
    }
  }

  List<double> CADtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    List<double> resultNDrates = [];
    double EURrate = exchangeRate.rates.eUR;
    double CHFrate = exchangeRate.rates.cHF;
    double NGNrate = exchangeRate.rates.nGN;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      resultNDrates.add(USDrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      resultNDrates.add(CHFrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      resultNDrates.add(NGNrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      resultNDrates.add(USDrate);
      resultNDrates.add(result);
      return resultNDrates;
    }
  }


  List<double> NGNtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    List<double> resultNDrates = [];
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      resultNDrates.add(CADrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      resultNDrates.add(CHFrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      resultNDrates.add(EURrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      resultNDrates.add(USDrate);
      resultNDrates.add(result);
      return resultNDrates;
    }
  }

  List<double> CHFtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    List<double> resultNDrates = [];
    double CADrate = exchangeRate.rates.cAD;
    double NGNrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      resultNDrates.add(CADrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      resultNDrates.add(NGNrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      resultNDrates.add(EURrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      resultNDrates.add(USDrate);
      resultNDrates.add(result);
      return resultNDrates;
    }
  }

  List<double> USDtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    List<double> resultNDrates = [];
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double NGNrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      resultNDrates.add(CADrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      resultNDrates.add(CHFrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      resultNDrates.add(EURrate);
      resultNDrates.add(result);
      return resultNDrates;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      resultNDrates.add(NGNrate);
      resultNDrates.add(result);
      return resultNDrates;
    }
  }


}
