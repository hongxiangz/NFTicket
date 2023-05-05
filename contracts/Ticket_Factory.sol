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

        Ticket_Market newMarketplace =
            new Ticket_Market(token, newHong);

        address newHongAddress = address(newHong);

        activeHongs.push(newHongAddress);
        activeHongsMapping[newHongAddress] = Hong({
            ticketName: TicketName,
            ticketSymbol: TicketSymbol,
            ticketPrice: ticketPrice,
            totalSupply: totalSupply,
            marketplace: address(newMarketplace)
        });

        emit Created(newHongAddress, address(newMarketplace));

        return newHongAddress;
    }

    // Get all active hongs
    function getActiveFests() public view returns (address[] memory) {
        return activeFests;
    }

    // Get hong's details
    function getHongDetails(address festAddress)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            uint256,
            address
        )
    {
        return (
            activeHongsMapping[hongAddress].ticketName,
            activeHongsMapping[hongAddress].ticketSymbol,
            activeHongsMapping[hongAddress].ticketPrice,
            activeHongsMapping[hongAddress].totalSupply,
            activeHongsMapping[hongAddress].marketplace
        );
    }


}