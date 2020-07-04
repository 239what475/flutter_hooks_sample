abstract class SampleRepository {
  String loadMessage();
}

class SampleDataSource implements SampleRepository {
  @override
  String loadMessage() => 'Hello World';
}
