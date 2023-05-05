pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Ticket_Nft.sol";
import "./Ticket_Market.sol";

contract Ticket_Factory is Ownable {
    struct Ticket {
        string activities_name;
        string ticketSymbol;
        uint256 ticketPrice;
        uint256 totalSupply;
        address marketplace;
    }

}