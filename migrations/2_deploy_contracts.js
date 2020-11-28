const ArtToken = artifacts.require("ArtToken");

module.exports = function(deployer) {
  deployer.deploy(ArtToken);
}
