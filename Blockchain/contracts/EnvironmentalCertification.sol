// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract EnvironmentalCertification {
    address public owner;
    struct transation{
        string date;
        address  recyclingCenter;
        string garbageType;
        uint256  purchasedQuantity;
        int price;
    }
    mapping(address => bool) public certifiedCompanies;
    mapping(address => transation[]) public transactions;
    mapping(address => uint256)public purchasedQuantities;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    event companyCertified(
        address _companyAddress
    );

    function certifyCompany(address _companyAddress) public onlyOwner {
        certifiedCompanies[_companyAddress] = true;
        emit companyCertified(_companyAddress);
    }

    function revokeCertification(address _companyAddress) public onlyOwner {
        certifiedCompanies[_companyAddress] = false;
    }

    function isCertified(address _companyAddress) public view returns (bool) {
        return certifiedCompanies[_companyAddress];
    }
    function recordTransaction(transation memory trans) public onlyOwner {
        //require(certifiedCompanies[_companyAddress], "Company must be certified to record purchases"); 
        transactions[trans.recyclingCenter].push(trans);
        purchasedQuantities[trans.recyclingCenter] += trans.purchasedQuantity;
    }
    function getPurchasedQuantity(address _companyAddress) public view returns (uint256) {
        return purchasedQuantities[_companyAddress];
    }
}