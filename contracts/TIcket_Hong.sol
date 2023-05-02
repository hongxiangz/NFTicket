pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Context.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Ticket_Hong is Context, ERC20 {
    constructor() public ERC20("HongToken", "Hong") {
        _mint(_msgSender(), 10000 * (10**uint256(decimals())));
    }
}
