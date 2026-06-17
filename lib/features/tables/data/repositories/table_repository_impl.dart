import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/domain/repositories/table_repository.dart';

final tableRepositoryProvider = Provider<TableRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return TableRepositoryImpl(apiClient);
});

class TableRepositoryImpl implements TableRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  TableRepositoryImpl(this._apiClient);

  @override
  Future<List<TableModel>> getTables() async {
    try {
      _logger.i('Fetching tables list');
      final response = await _apiClient.get(ApiConstants.getTablesEndpoint);
      if (response.data is List) {
        final tables = (response.data as List)
            .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${tables.length} tables');
        return tables;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch tables', error: e);
      rethrow;
    }
  }

  @override
  Stream<List<TableModel>> getTablesStream() async* {
    while (true) {
      try {
        final tables = await getTables();
        yield tables;
      } catch (e) {
        _logger.w('Table stream fetch failed, retrying in 10s', error: e);
      }
      await Future.delayed(const Duration(seconds: 10));
    }
  }

  @override
  Future<void> transferTable(int orderId, int targetTableId) async {
    try {
      _logger.i('Transferring order $orderId to table $targetTableId');
      await _apiClient.put(
        ApiConstants.changeTableEndpoint,
        data: {
          'orderID': orderId,
          'tableID': targetTableId,
        },
      );
      _logger.i('Table transfer successful');
    } catch (e) {
      _logger.e('Failed to transfer table', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createTable(TableModel table) async {
    try {
      _logger.i('Creating new table: ${table.tableNumber}');
      await _apiClient.post(
        ApiConstants.createTableEndpoint,
        data: table.toJson(),
      );
      _logger.i('Table creation successful');
    } catch (e) {
      _logger.e('Failed to create table', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateTable(TableModel table) async {
    try {
      _logger.i('Updating table: ${table.tableID}');
      final endpoint = ApiConstants.updateTableEndpoint.replaceFirst(':id', table.tableID.toString());
      await _apiClient.put(
        endpoint,
        data: table.toJson(),
      );
      _logger.i('Table update successful');
    } catch (e) {
      _logger.e('Failed to update table', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteTable(int tableId) async {
    try {
      _logger.i('Deleting table: $tableId');
      final endpoint = ApiConstants.deleteTableEndpoint.replaceFirst(':id', tableId.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Table deletion successful');
    } catch (e) {
      _logger.e('Failed to delete table', error: e);
      rethrow;
    }
  }
}
