abstract class PersistenceController {
  Future<void> init();
  Future<List<String>> getAllData();
  Future<void> saveData(String goldCalcHistory);
}