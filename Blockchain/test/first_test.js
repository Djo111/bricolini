const FirstTest = artifacts.require("FirstTest");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("FirstTest", function (/* accounts */) {
  it("should assert true", async function () {
    await FirstTest.deployed();
    return assert.isTrue(true);
  });
});
