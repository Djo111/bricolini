const MyContract = artifacts.require("EnvironmentalCertification");

module.exports = function (deployer) {
  // Deploy MyContract
  deployer.deploy(MyContract);
};