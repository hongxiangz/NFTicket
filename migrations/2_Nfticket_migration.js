const Ticket_Hong = artifacts.require("Ticket_Hong");
const Ticket_Factory = artifacts.require("Ticket_Factory");

module.exports = function (deployer) {
  deployer.deploy(Ticket_Hong);
  deployer.deploy(Ticket_Factory);
};
