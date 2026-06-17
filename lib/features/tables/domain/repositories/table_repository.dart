import 'package:nextrestro/features/tables/data/models/table_model.dart';

abstract class TableRepository {
  Future<List<TableModel>> getTables();
  Stream<List<TableModel>> getTablesStream();
  Future<void> transferTable(int orderId, int targetTableId);
  Future<void> createTable(TableModel table);
  Future<void> updateTable(TableModel table);
  Future<void> deleteTable(int tableId);
}
