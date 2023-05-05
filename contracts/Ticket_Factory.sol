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

    address[] private activeHongs;
    mapping(address => Ticket) private activeHongsMapping;

    event Created(address ntfAddress, address marketplaceAddress);

    // Creates new NFT and a marketplace for its purchase
    function createNewFest(
        FestToken token,
        string memory festName,
        string memory festSymbol,
        uint256 ticketPrice,
        uint256 totalSupply
    ) 
    public onlyOwner returns (address) {
        FestivalNFT newFest =
            new FestivalNFT(
                festName,
                festSymbol,
                ticketPrice,
                totalSupply,
                msg.sender
            );

            
}