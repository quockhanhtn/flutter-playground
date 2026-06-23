abstract class Usecase<DataType, ParamsType> {
  Future<DataType> call({ParamsType params});
}
