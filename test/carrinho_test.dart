import 'dart:math';

import 'package:test/test.dart';
import 'package:testes_unitarios/carrinho.dart';
import 'package:testes_unitarios/item.dart';

void main() {
  group(
    'G1 - Testes de calculo de valor total do carrinho...',
    () {
      test('Deve calcular o valor total do carrinho CHEIO', () async {
        //!PREPARAÇÃO DO TESTE
        //*PREPARAÇÃO DO TESTE
        final items = [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Iphone 12', preco: 10000),
          Item(nome: 'Carregador Apple', preco: 600),
        ];
        final carrinho = Carrinho(items: items);
        //
        //!AÇÃO OU EXECUÇÃO
        //*AÇÃO OU EXECUÇÃO
        var valorTotalCarrinho = carrinho.totalCarrinho();
        //
        //!VERIFICAÇÃO
        expect(valorTotalCarrinho, 12600);
      });

      test('Deve calcular o valor total do carrinho VAZIO', () async {
        //!PREPARAÇÃO DO TESTE
        //*PREPARAÇÃO DO TESTE
        final items = <Item>[];
        final carrinho = Carrinho(items: items);
        //
        //!AÇÃO OU EXECUÇÃO
        //*AÇÃO OU EXECUÇÃO
        var valorTotalCarrinho = carrinho.totalCarrinho();
        //
        //!VERIFICAÇÃO
        expect(valorTotalCarrinho, 0);
      });
    },
  );
  group(
    "G2 - Calculo Valor total de carrinho com imposto 10%",
    () {
      test('Deve calcular o valor total do carrinho com imposto de 10%', () {
        //PREPARAR
        final items = [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Iphone 12', preco: 10000),
          Item(nome: 'Carregador Apple', preco: 600),
        ];
        final carrinho = Carrinho(items: items);

        //VERIFICAR
        var valorTotalComImposto = carrinho.totalCarrinhoComImposto();

        //EXECUTAR
        expect(valorTotalComImposto, 13860);
      });

      //Se valor do carrinho for menor que 5.000, não cobra imposto
      //Se valor maior que 20.000, cobra imposto de 20%
      test(
          '\nDeve retornar o valor original SEM imposto caso seja MENOR que R\$5.000',
          () {
        // preparação
        final carrinho = Carrinho(items: [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Fone ouvido', preco: 2000),
          Item(nome: 'Carregador', preco: 600),
        ]);

        //Verificação
        var valorTotalComOuSemImposto = carrinho.totalCarrinhoComImposto();
        //EXECUÇÃO
        expect(valorTotalComOuSemImposto, 4600);
      });
      test(
          '\nDeve retornar o valor original COM imposto de +10% caso seja MAIOR que R\$5.000',
          () {
        // preparação
        final carrinho = Carrinho(items: [
          Item(nome: 'Galaxy J1', preco: 2000),
          Item(nome: 'Fone ouvido', preco: 3000),
        ]);
        //Verificação
        var valorTotalComOuSemImposto = carrinho.totalCarrinhoComImposto();
        //EXECUÇÃO
        expect(valorTotalComOuSemImposto, 5500);
      });
      test(
          '\nDeve retornar o valor original COM imposto de +20% caso seja MAIOR que R\$20.000',
          () {
        // preparação
        final carrinho = Carrinho(items: [
          Item(nome: 'Galaxy J1', preco: 12000),
          Item(nome: 'Fone ouvido', preco: 13000),
        ]);
        //Verificação
        var valorTotalComOuSemImposto = carrinho.totalCarrinhoComImposto();
        //EXECUÇÃO
        expect(valorTotalComOuSemImposto, 30000);
      });
    },
  );
}
