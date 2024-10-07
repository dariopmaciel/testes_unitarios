import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:testes_unitarios/item.dart';
import 'package:testes_unitarios/item_repository.dart';
import 'package:testes_unitarios/item_service.dart';

// ! Não fazer desta forma
// class ItemRepositoryFake implements IItemRepository {
//   @override
//   Future<List<Item>> buscarTodosAsync() async {
//     // throw Exception();
//     return <Item>[];
//   }

//   @override
//   List<Item> buscarTodosSync() {

//     return [];
//   }

//   @override
//   Item buscarPorId(int id) {
//     return Item(nome: "Item teste ", preco: 10);
//   }
// }

// class ItemRepositoryFakeException implements IItemRepository {
//   @override
//   Future<List<Item>> buscarTodosAsync() async {
//     throw Exception();

//   }

//   @override
//   List<Item> buscarTodosSync() {

//     return [];
//   }

//   @override
//   Item buscarPorId(int id) {
//     return Item(nome: "Item teste ", preco: 10);
//   }
// }

class ItemRepositoryFake extends Mock implements IItemRepository {}

void main() {
  late IItemRepository itemRepository;

  setUp(
    () {
      print("<-- Executando Setup ->>");
      itemRepository = ItemRepositoryFake();
    },
  );

  test('Asyncrono - Buscar TODOS os Itens ...', () async {
    //Comportamento
    when(() => itemRepository.buscarTodosAsync())
        .thenAnswer((_) async => <Item>[]);

    var service = ItemService(repository: itemRepository);

    final items = await service.buscarTodosAsync();

    expect(items, <Item>[]);
  });

  test('Asyncrono - Buscar TODOS os Itens retornam uma EXCEPTION...', () async {
    // Comportamento
    when(() => itemRepository.buscarTodosAsync()).thenThrow(Exception());
    var service = ItemService(repository: itemRepository);

    final call = service.buscarTodosAsync;

    expect(() => call(), throwsException);
  });
}
