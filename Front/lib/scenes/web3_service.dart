import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:js' as js;
import 'package:http/http.dart' as http;

class Web3Service {
  late Web3Client _client;

  Future<void> init() async {
    // Connect to Ganache or any Ethereum network
    _client = Web3Client('http://localhost:7545', http.Client());
  }

  Future<String> getAccountAddress() async {
    // Check if the window.ethereum object is available
    if (js.context.hasProperty('ethereum')) {
      final ethereum = js.context['ethereum'];

      // Request access to the user's MetaMask accounts
      await ethereum.callMethod('request', ['eth_requestAccounts']);

      // Get the selected account
      final accounts =
          await ethereum.callMethod('send', {'method': 'eth_accounts'});
      return accounts[0];
    }

    // If MetaMask is not available, you can handle the error or prompt the user to install it.
    throw Exception('MetaMask is not available.');
  }
}
