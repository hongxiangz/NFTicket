pragma solidity ^0.8.0;

import "./Ticket_Factory.sol";
import "./TIcket_Hong.sol";

contract FestivalMarketplace {
    TIcket_Hong private _token;
    Ticket_Factory private _NFT;

    address private _organiser;

    constructor(TIcket_Hong token, Ticket_Factory NFT) public {
        _token = token;
        _NFT = NFT;
        _organiser = _NFT.getOrganiser();
    }

    event Purchase(address indexed buyer, address seller, uint256 ticketId);

    // Purchase tickets from the organiser directly
    function purchaseTicket() public {
        address buyer = msg.sender;

        _token.transferFrom(buyer, _organiser, _NFT.getTicketPrice());

        _NFT.transferTicket(buyer);
    }
    
    // Purchase ticket from the secondary market hosted by organiser
    function secondaryPurchase(uint256 ticketId) public {
        address seller = _NFT.ownerOf(ticketId);
        address buyer = msg.sender;
        uint256 sellingPrice = _NFT.getSellingPrice(ticketId);
        uint256 commision = (sellingPrice * 10) / 100;

        _token.transferFrom(buyer, seller, sellingPrice - commision);
        _token.transferFrom(buyer, _organiser, commision);

        _NFT.secondaryTransferTicket(buyer, ticketId);

        emit Purchase(buyer, seller, ticketId);
    }

}
