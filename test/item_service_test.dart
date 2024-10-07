import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';
import 'package:testes_unitarios/item_service.dart';

class ItemRepositoryFake implements IItemRepository {
  @override
  Future<List<Item>> buscarTodosAsync() async {
    return <Item>[];
  }

  @override
  List<Item> buscarTodosSync() {
    return [];
  }

  @override
  Item buscarPorId(int id) {
    return Item(nome: "Item teste ", preco: 10);
  }
}

void main() {
  test('Buscar TODOS os Itens Asyncrono...', () async {
    var service = ItemService(repository: ItemRepositoryFake());

    final items = await service.buscarTodosAsync();

    expect(items, <Item>[]);
  });
}
