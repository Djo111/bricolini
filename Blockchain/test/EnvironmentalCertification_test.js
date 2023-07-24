const EnvironmentalCertification = artifacts.require("EnvironmentalCertification");

contract("EnvironmentalCertification", function (accounts) {
  let certificationInstance;

  before(async () => {
    certificationInstance = await EnvironmentalCertification.deployed();
  });

  it("should certify a company", async function () {
    const companyAddress = accounts[1];

    await certificationInstance.certifyCompany(companyAddress);

    const isCertified = await certificationInstance.isCertified(companyAddress);
    return assert.isTrue(isCertified, "Company should be certified");
  });

  it("should revoke a company's certification", async function () {
    const companyAddress = accounts[1];

    await certificationInstance.revokeCertification(companyAddress);

    const isCertified = await certificationInstance.isCertified(companyAddress);
    return assert.isFalse(isCertified, "Company certification should be revoked");
  });

  it("should record a transaction", async function () {
    const companyAddress = accounts[1];
    const transaction = {
      date: "2023-07-20",
      recyclingCenter: accounts[2],
      garbageType: "Plastic",
      purchasedQuantity: 100,
      price: 1000,
    };

    await certificationInstance.recordTransaction(transaction);

    const purchasedQuantity = await certificationInstance.getPurchasedQuantity(
      transaction.recyclingCenter
    );
    return assert.equal(purchasedQuantity.toNumber(), transaction.purchasedQuantity, "Purchased quantity should be recorded");
  });
});
