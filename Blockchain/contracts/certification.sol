// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract EnvironmentalCertification {
    address public owner;
    mapping(address => bool) public certifiedCompanies;
    mapping(address => uint256) public purchasedQuantities;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function certifyCompany(address _companyAddress) public onlyOwner {
        certifiedCompanies[_companyAddress] = true;
    }

    function revokeCertification(address _companyAddress) public onlyOwner {
        certifiedCompanies[_companyAddress] = false;
    }

    function isCertified(address _companyAddress) public view returns (bool) {
        return certifiedCompanies[_companyAddress];
    }
    function recordPurchasedQuantity(address _companyAddress, uint256 _quantity) public onlyOwner {
        //require(certifiedCompanies[_companyAddress], "Company must be certified to record purchases"); 
        purchasedQuantities[_companyAddress] += _quantity;
    }
    function getPurchasedQuantity(address _companyAddress) public view returns (uint256) {
        return purchasedQuantities[_companyAddress];
    }
}