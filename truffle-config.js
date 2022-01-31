const HDWalletProvider = require("@truffle/hdwallet-provider");
const secret= require('./secrets.json'); 

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  //Working Faucet: https://app.mycrypto.com/faucet
  networks: {
    development: {
      // host: "127.0.0.1",
      host: "172.25.32.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    develop: {
      port: 8545
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(secret.mnemonic, "wss://ropsten.infura.io/ws/v3/"+secret.projectId)
      },
      network_id: 3,
      gas: 4000000
    }
  },
  compilers: {
    solc: {
      version: "0.8.11" 
    },
 }
};
