pragma solidity ^0.8.0;

contract Contracts {
    address public vendor;
    uint public ticketPrice;
    uint public totalTickets;
    
    mapping(address => uint) public ticketBalances;
    
    event TicketPurchased(address buyer, uint amount);
    event TicketCancelled(address buyer, uint amount);
    
    modifier onlyVendor() {
        require(msg.sender == vendor, "Only vendor can perform this action");
        _;
    }
    
    modifier ticketAvailable() {
        require(totalTickets > 0, "No more tickets available");
        _;
    }
    
    modifier onlyOnce() {
        require(ticketBalances[msg.sender] == 0, "You can only purchase one ticket at a time");
        _;
    }
    
    constructor(uint _ticketPrice, uint _totalTickets) {
        vendor = msg.sender;
        ticketPrice = _ticketPrice;
        totalTickets = _totalTickets;
    }
    
    function buyTicket() external payable ticketAvailable onlyOnce {
        require(msg.value >= ticketPrice, "Insufficient funds");
        
        ticketBalances[msg.sender] += 1;
        totalTickets -= 1;
        
        emit TicketPurchased(msg.sender, 1);
    }
    
    function cancelTicket() external onlyVendor {
        require(ticketBalances[msg.sender] > 0, "You have no tickets to cancel");
        
        totalTickets += ticketBalances[msg.sender];
        emit TicketCancelled(msg.sender, ticketBalances[msg.sender]);
        
        ticketBalances[msg.sender] = 0;
    }
    
    function withdraw() external onlyVendor {
        payable(vendor).transfer(address(this).balance);
    }
}