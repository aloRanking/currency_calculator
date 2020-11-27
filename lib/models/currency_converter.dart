class CurrencyConvert {
  String base;
  String date;
  Rates rates;

  CurrencyConvert({this.base, this.date, this.rates});

  CurrencyConvert.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['date'] = this.date;
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    return data;
  }
}

class Rates {
  double cAD;
  double cHF;
  double gBP;
  double sEK;
  double eUR;
  double uSD;
  double nGN;

  Rates({this.cAD, this.cHF, this.gBP, this.sEK, this.eUR, this.uSD, this.nGN});

  Rates.fromJson(Map<String, dynamic> json) {
    cAD = json['CAD'];
    cHF = json['CHF'];
    gBP = json['GBP'];
    sEK = json['SEK'];
    eUR = json['EUR'];
    uSD = json['USD'];
    nGN = json['NGN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CAD'] = this.cAD;
    data['CHF'] = this.cHF;
    data['GBP'] = this.gBP;
    data['SEK'] = this.sEK;
    data['EUR'] = this.eUR;
    data['USD'] = this.uSD;
    data['NGN'] = this.nGN;
    return data;
  }
}
