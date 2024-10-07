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
  late IItemRepository itemRepository ;//
  // IItemRepository itemRepository = ItemRepositoryFake(); 

//PREPARAÇÃO (todo em todo teste)
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

  test(
    "Buscar por ID",
    () {
      // Ao se fazer assim, da erro no de baixo
      // when(() => itemRepository.buscarPorId(1)).thenReturn(Item(nome: 'Item X', preco: 10));

      //Com a função ANY, qualquer coisa q buscar vai retornar o memso, testando a BUSCA e não o ITEM
      when(() => itemRepository.buscarPorId(any()))
          .thenReturn(Item(nome: 'Item X', preco: 10));

      var service = ItemService(repository: itemRepository);
      // ao se buscar outro diferente de 1 da erro
      // var item = service.buscarPorId(2);

      var item = service.buscarPorId(1);
      //TESTE MOCK DO REPOSITORY
      verify(() => itemRepository.buscarPorId(any())).called(1);
      expect(item, isNotNull);
    },
  );

  test(
    "Buscar por ID ANY com VERIFICAÇÃO",
    () {
      //preparação
      when(() => itemRepository.buscarPorId(any()))
          .thenReturn(Item(nome: 'Item X', preco: 10));

      var service = ItemService(repository: itemRepository);

      //AÇÂO/ EXECUÇÃO
      var item = service.buscarPorId(2); //se mudar de ID TB verifica

      //VERIFICAÇÃO/VALIDAÇÃO

      // verify (() => itemRepository.buscarPorId(any())).called(1);
      //OU ESTE para varifica se o valor chamado foi '1'
      verify(() => itemRepository.buscarPorId(2)).called(1);

      expect(item, isNotNull);
    },
  );
}
