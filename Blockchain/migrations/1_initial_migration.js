const MyContract = artifacts.require("Migrations");

module.exports = function (deployer) {
  // Deploy MyContract
  deployer.deploy(MyContract);
};