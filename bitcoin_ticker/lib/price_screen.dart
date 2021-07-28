import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; //dart:io중 Platform만 사용할시
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    super.initState();
    getCoinPrices();
  }

  String _selectedValue = 'AUD';

  Map<String, String> coinPrices = {};

  bool isWaiting = false;
  //진행중인지 파악하기위한 isWaiting

  void getCoinPrices() async {
    isWaiting = true;
    coinPrices={};
    try {
      var data = await CoinData().getCoinData(_selectedValue);
      //BTC:123,LTC:123 과같은 map의 형태의 자료로 전달받아옴.
      isWaiting = false;
      setState(() {
        coinPrices = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(crypto, coinPrices[crypto] ?? '?', _selectedValue),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(item);
    }
    return DropdownButton<String>(
      value: _selectedValue,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          _selectedValue = value.toString();
          getCoinPrices();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Center(
          child: Text(currency),
        ),
      );
    }
    return CupertinoPicker(
      //cupertinoPicker상 item의 높이 설정
      itemExtent: 48.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          _selectedValue = currenciesList[selectedIndex];
          getCoinPrices();
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          makeCards(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  final String cryptoCurrency;
  final String price;
  final String selectedCurrency;
  CryptoCard(
    this.cryptoCurrency,
    this.price,
    this.selectedCurrency,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $price $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
