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


}
