abstract class Usecase<DataType, Params> {
  Future<DataType> call({Params params});
}
