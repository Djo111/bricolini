
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TransactionManagement {

    struct Transaction {
        uint256 date;
        string wasteType;
        uint256 quantity;
        uint256 price;
    }

    // Mapping to store transactions for each recycling center
    mapping(address => Transaction[]) private recyclingCenterTransactions;
    event TransactionAdded(address rc,uint256 date,string wasteType,uint256 quantity,uint256 price);
    // Function to add a transaction for a recycling center
    function addTransaction(
        uint256 date,
        string memory wasteType,
        uint256 quantity,
        uint256 price
    ) public {
        Transaction memory newTransaction = Transaction(date, wasteType, quantity, price);
        recyclingCenterTransactions[msg.sender].push(newTransaction);
        emit TransactionAdded(msg.sender, date, wasteType, quantity, price);
    }
    event TransactionsEvent(address rc,Transaction[] tr);
    // Function to get all transactions for a recycling center
    function getTransactions() public returns (Transaction[] memory) {
         Transaction[] memory transactions = recyclingCenterTransactions[msg.sender];
         emit TransactionsEvent(msg.sender,transactions); 
         return transactions;
    }
}