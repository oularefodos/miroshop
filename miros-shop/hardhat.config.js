require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  paths: {
    artifacts: "./src/arctifacts"
  },
  networks: {
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/f0a960a462194596a86d57cf7b3ebe77",
      accounts: ["4fe0b826ddcfd55c200b5514e437b2fa425284e2bb543880f5a55436313acc3f"]
    }
  }
};
