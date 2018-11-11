var adoption = artifacts.require('Adoption');

module.exports = function (deployer){
    // console.log(adoption);
    deployer.deploy(adoption);
}