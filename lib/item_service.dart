// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';

class ItemService {
  IItemRepository repository;

  ItemService({required this.repository});

//async
  Future<List<Item>> buscarTodosAsync() => repository.buscarTodosAsync();
//sync
  List<Item> buscarTodosSync() => repository.buscarTodosSync();
//buscar por ID
  Item buscarPorId(int id) => repository.buscarPorId(id);
}
