// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MetaCoin {
	mapping (address => uint) balances;
    string symbol = "MTC";
    string name = "MetaCoin";

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() {
		balances[tx.origin] = 10000;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}

    function getName() public view returns(string memory){
        return name;
    }

    function getSymbol() public view returns(string memory){
        return symbol;
    }
}