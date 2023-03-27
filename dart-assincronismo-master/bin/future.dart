void main() {
  // Future myFuture = Future((() {
  //   print("Going back to the Future");
  //   return 42;
  // })).then((value) => print('The value is $value'));

  Future<int> myFutureFunc() async {
    print("I have a function in the future");
    await Future.delayed(Duration(seconds: 5));
    throw Exception();
    return 21;
  }

  // myFutureFunc()
  //     .then((value) => print('My function value is: $value'))
  //     .onError((error, stackTrace) => print('An error occurred'))
  //     .whenComplete(() => print('The future is over'));

  Future<int> myFutureErrorFunc(int a, int b) async {
    try {
      if (a > b) {
        throw Exception();
      }
      print('I am a Functional Function');
      await Future.delayed(Duration(seconds: 5));
      return 42;
    } catch (e) {
      print('An Error occurred: $e');
      return 42;
    } finally {
      print('The Future is finally Over');
    }
  }

  myFutureErrorFunc(1, 2).then((value) => print('The value is: $value'));

  print('Done with main');
}
