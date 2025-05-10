import 'package:test_stream/test_stream.dart';

void main() {
  var myStream = NumberGenerator().stream;
  var mySub = myStream.listen(
    (data) {
      print('data: $data');
    },
    onError: (errror) {
      print('error : $errror');
    },
    onDone: () {
      print('Stream compleated');
    },
  );

  Future.delayed(Duration(seconds: 5), () {
    mySub.cancel();
  });
}
