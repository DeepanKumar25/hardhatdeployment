//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract AccessPass is ERC1155, ERC2981, Ownable {
    uint public totalSupply = 50000;
    uint public counter = 0;
    string public name = "MetaDogeUnity Pass";
    address public deployer;
    mapping(uint256 => uint256) private _tokenSupply;


    constructor(uint96 _royaltyFeesInBips) ERC1155("") Ownable(msg.sender) {
        setRoyaltyInfo(owner(), _royaltyFeesInBips);
        deployer = msg.sender;
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mintToken1(address account) public payable {
        require(msg.value >= 1000000000000000 wei, "Insufficient payment"); // 0.001 ether
        require(_tokenSupply[1] < totalSupply, "Token 1 supply exceeded");
        _mint(account, 1, 1, "0x");
        _tokenSupply[1]++;
         (bool success, ) = owner().call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }

    function mintToken2(address account) public payable {
        require(msg.value >= 1000000000000000 wei, "Insufficient payment"); // 0.001 ether
        require(_tokenSupply[2] < totalSupply, "Token 1 supply exceeded");
        _mint(account, 2, 1, "0x");
        _tokenSupply[2]++;
         (bool success, ) = owner().call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }

    function mintToken3(address account) public payable {
        require(msg.value >= 1000000000000000 wei, "Insufficient payment"); // 0.001 ether
        require(_tokenSupply[3] < totalSupply, "Token 1 supply exceeded");
        _mint(account, 3, 1, "0x");
        _tokenSupply[3]++;
         (bool success, ) = owner().call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }

    function mintToken4(address account) public payable {
        require(msg.value >= 1000000000000000 wei, "Insufficient payment"); // 0.001 ether
        require(_tokenSupply[4] < totalSupply, "Token 1 supply exceeded");
        _mint(account, 4, 1, "0x");
        _tokenSupply[4]++;
         (bool success, ) = owner().call{value: address(this).balance}("");
        require(success, "Transfer failed.");
    }

    function uri(uint256 tokenId) override public pure returns (string memory) {
        return (string(abi.encodePacked(
            "https://ipfs.io/ipfs/QmWcvWUs6efifC1wHaKwHoVMHgufK5FeMkh2rVHBRmmZFH/",
            Strings.toString(tokenId),
            ".json"
        )));
    }

    function transfer(address to, uint256 tokenId) public {
        require(balanceOf(msg.sender, tokenId) >= 1, "Insufficient balance");
        safeTransferFrom(msg.sender, to, tokenId, 1, "0x");
    }

    function supportsInterface(bytes4 interfaceId)
        public view virtual override(ERC1155, ERC2981)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
        _setDefaultRoyalty(_receiver, _royaltyFeesInBips);
    }
}