import 'package:currencycalculator/models/currency_converter.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  Dio _dio = Dio();

  String _baseUrl = "https://api.exchangeratesapi.io/latest";

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

  double EURtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double NGNrate = exchangeRate.rates.nGN;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      return result;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      return result;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      return result;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      return result;
    }
  }

  double CADtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    double EURrate = exchangeRate.rates.eUR;
    double CHFrate = exchangeRate.rates.cHF;
    double NGNrate = exchangeRate.rates.nGN;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      return result;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      return result;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      return result;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      return result;
    }
  }


  double NGNtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      return result;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      return result;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      return result;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      return result;
    }
  }

  double CHFtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    double CADrate = exchangeRate.rates.cAD;
    double NGNrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double USDrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      return result;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      return result;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      return result;
    }

    if (currency2 == 'USD') {
      result = USDrate * currency1;
      return result;
    }
  }

  double USDtoCurrency(
      CurrencyConvert exchangeRate, double currency1, String currency2) {
    double CADrate = exchangeRate.rates.cAD;
    double CHFrate = exchangeRate.rates.cHF;
    double EURrate = exchangeRate.rates.eUR;
    double NGNrate = exchangeRate.rates.uSD;

    double result;

    if (currency2 == 'CAD') {
      result = CADrate * currency1;
      return result;
    }

    if (currency2 == 'CHF') {
      result = CHFrate * currency1;
      return result;
    }

    if (currency2 == 'EUR') {
      result = EURrate * currency1;
      return result;
    }

    if (currency2 == 'NGN') {
      result = NGNrate * currency1;
      return result;
    }
  }


}
