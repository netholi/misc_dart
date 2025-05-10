class NumberGenerator {
  NumberGenerator();

  static Stream<int> _getNumber() async* {
    int num = 0;
    while (num < 10) {
      await Future.delayed(Duration(seconds: 1));
      yield num++;
    }
  }

  Stream<int> get stream {
    return _getNumber();
  }
}

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
