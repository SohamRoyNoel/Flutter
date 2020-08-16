import 'package:bitcoin_ticker/utility/networking.dart';

const apiKey = 'E7BCC190-E51F-4C62-BD1A-A6D0C7BB4B9C';

class ConvertNow {
  Future<dynamic> getConData(String convertFrom, String convertTo) async {
    NetWorking networkHelper = NetWorking(
        url:
            'https://rest.coinapi.io/v1/exchangerate/$convertFrom/$convertTo?apiKey=$apiKey');
    var data = await networkHelper.getData();
    print('data: $data');
    return data;
  }
}
