import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount;

  // Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if (randomNumber <= 5) {
    myAccount = Account(name: "Johann", balance: 15000, isAuthenticated: true);
  }

  print(myAccount.runtimeType);

  // if (myAccount != null) {
  //   print(myAccount.balance);
  // } else {
  //   print("Conta Nula");
  // }

  // print(myAccount != null ? myAccount.balance : "Conta nula...");

  print(myAccount?.balance);
}

void main() {
  testingNullSafety();
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  // Account accountTeste = Account(name: "Ricarth", balance: -20, isAuthenticated: true);
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 800, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 700);
    // Observando resultado
    print(result);
  } on SenderIdInvalidException catch (e) {
    print("O ID '${e.idSender}' do remetente não é um ID válido");
  } on ReceiverIdInvalidException catch (e) {
    print("O ID '${e.idReceiver}' do destinatário não é um ID válido");
  } on SenderNotAuthenticatedException catch (e) {
    print("O usuário do remetente de ID '${e.idSender}' não está autenticado");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(
        "O usuário de ID '${e.idSender}' tentou enviar '${e.amount}' sendo que na sua conta tem apenas '${e.senderBalance}'");
  } on Exception {
    print("Algo deu errado");
  }
}
