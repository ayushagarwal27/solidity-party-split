// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Party {
    uint256 deposit;
    address [] members;
    mapping(address => bool) paid;

    constructor(uint256 _deposit) {
        deposit = _deposit;
    }

    function rsvp() external payable {
        require(!paid[msg.sender], "Cannot RSVP twice" );
        require(deposit == msg.value, "Deposit is less");
        members.push(msg.sender);
        paid[msg.sender] = true;
    }

    function payBill(address venue, uint amount) external {
//        Pay from contract address
        (bool s1, ) =  venue.call{value: amount}("");
        require(s1);

//        Individual remaining share of each member
        uint share = address(this).balance / members.length;

//        Distribute amount from contract address
        for(uint i = 0; i< members.length; i++){
            (bool s2, ) =   members[i].call{value:share}("");
            require(s2);
        }
    }
}