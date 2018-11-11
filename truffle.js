require('dotenv').config();
const HDWalletProvider = require('truffle-hdwallet-provider');

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    },
    sokol: {
      provider: function(){
        return new HDWalletProvider(process.env.MNEMONIC, `https://poa.infura.io/${process.env.INFURA_API_KEY}`)
      },  
      network_id: 77, // Match any network id,
      gas: 8000000,
      gasPrice: 100000000

    }
  }
};
