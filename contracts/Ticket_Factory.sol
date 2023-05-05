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
    function createNewHong(
        Ticket_Hong token,
        string memory TicketName,
        string memory TicketSymbol,
        uint256 TicketPrice,
        uint256 TotalSupply
    ) 
    public onlyOwner returns (address) {
        Ticket_Nft newTicket =
            new Ticket_Nft(
                TicketName,
                TicketSymbol,
                TicketPrice,
                TotalSupply,
                msg.sender
            );

        FestivalMarketplace newMarketplace =
            new FestivalMarketplace(token, newFest);

        address newFestAddress = address(newFest);

        activeFests.push(newFestAddress);
        activeFestsMapping[newFestAddress] = Festival({
            festName: TicketName,
            festSymbol: TicketSymbol,
            ticketPrice: ticketPrice,
            totalSupply: totalSupply,
            marketplace: address(newMarketplace)
        });

        emit Created(newFestAddress, address(newMarketplace));

        return newFestAddress;
    }


}