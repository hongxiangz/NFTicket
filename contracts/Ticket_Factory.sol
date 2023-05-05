pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Ticket_Nft.sol";
import "./Ticket_Market.sol";

contract Ticket_Factory is Ownable {
    struct Ticket {
        string TicketName;
        string TicketSymbol;
        uint256 TicketPrice;
        uint256 TotalSupply;
        address marketplace;
    }

    

}