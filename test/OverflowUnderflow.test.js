var Vulnerable = artifacts.require(
  "./OverflowUnderflow.sol"
);

contract("Vulnerable", (accounts) => {
  var creatorAddress = accounts[0];
  var firstOwnerAddress = accounts[1];
  var secondOwnerAddress = accounts[2];
  var externalAddress = accounts[3];
  var unprivilegedAddress = accounts[4];
  /* create named accounts for contract roles */

  before(async () => {
    /* before tests */
  });

  beforeEach(async () => {
    /* before each context */
  });

  it("should revert if ...", () => {
    return Vulnerable.deployed()
      .then((instance) => {
        return instance.publicOrExternalContractMethod(argument1, argument2, {
          from: externalAddress,
        });
      })
      .then((result) => {
        assert.fail();
      })
      .catch((error) => {
        assert.notEqual(error.message, "assert.fail()", "Reason ...");
      });
  });

  context("testgroup - security tests - description...", () => {
    //deploy a new contract
    before(async () => {
      /* before tests */
      const newVulnerable = await Vulnerable.new();
    });

    beforeEach(async () => {
      /* before each tests */
    });

    it("fails on initialize ...", async () => {
      return assertRevert(async () => {
        await newVulnerable.initialize();
      });
    });

    it("checks if method returns true", async () => {
      assert.isTrue(await newVulnerable.thisMethodShouldReturnTrue());
    });
  });
});
