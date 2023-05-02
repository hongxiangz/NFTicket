# NFTicket

### Overview 

NFTicket is the blockchain-based solution for the booking and selling of online tickets, operating between parties who do not need to trust each other. The specific senario could be the ticket for cinema, theater, and football games. As for online ticket broker, what we are trying to improve is to effectively address the persistent problem of fraudulent tickets and unregulated ticket reselling at inflated prices on the black market. The platform is constructed on Ethereum blockchain network, where ERC721 tokens(NFT) are utilized to represent the specific tickets. We also have our own ERC20 token used as our currency to buy the tickets.

### Functionality
1. __Initiator interation__: Any acticity initiator can claim a new token as their ticket with specified ticket price and the total supply of tickets for the sale.
2. __Customer interation__: The customer can view the tickets being listed on the market, buy/sell the tickets via the market and view the tickets they own. 
3. __Restrain speculation__: The price at which customer can sell the ticket can not be more than 120% of the purchase price.
4. __comnnision return__: Tickets being sold through the secondary market adds a commission of 10% to the organiser which is deducted from the selling price the seller has listed.

#### Smart Contracts
Mainly 4 contracts listed under `./contracts` directory.

1. __Token_Hong__ 
    1. A contract for ERC20 token called Hong which is used to purchase tickets.
2. __Ticket_Nft__ 
    1. A contract for ERC721 tokens to represent tickets.
    2. The owner of the contract will also have minter role and only the owner can mint new tickets.
3. __Ticket_Market__ 
    1. A contract which acts as a marketplace for purchasing tickets from organiser and through market.
    2. This contract will act as a delegate approver for the Hong token as well as NFT token transfers.
4. __Ticket_Factory__ 
    1. A contract which implements a factory pattern with TicketNft contract to create new festivals on the fly.