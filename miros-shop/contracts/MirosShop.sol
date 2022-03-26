//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import '@openzeppelin/contracts/utils/Counters.sol';


contract MirosShop is ERC721URIStorage {

// structur of Item

    struct item {
        address owner;
        uint256 tokenId;
        uint256 price;
        string name;
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address owner;
    uint256 listenPrice = 0.01 ether;
    item[] public items;
    mapping (address => uint) sold;

    event ItemEvent(uint256 tokenId, uint256 price, address owner);

    constructor() ERC721("Miros", "MRS") {
        owner = msg.sender;
    }

// create Nft
    function _creatNft(string memory _metadata, uint256  _price, string memory _name) public payable {
        require(_price > 1, "price invalid");
        uint256 NewId = _tokenIds.current();
        _safeMint(msg.sender, NewId);
        _setTokenURI(NewId, _metadata);
        _createItem(NewId, _price, _name);
        _tokenIds.increment();
        emit ItemEvent(NewId, _price, msg.sender);
    }

    function _createItem (uint256  _tokenId, uint256 _price, string memory _name) internal {
        items[_tokenId] = item (
          msg.sender,
          _tokenId,
          _price,
          _name
        );
    }

// update price 
    function updateItemprice(uint _tokenId, uint256 _newPrice) public {
        require(msg.sender == ownerOf(_tokenId), "not autorized");
        items[_tokenId].price = _newPrice;
    }

// update listenPrice
    function updateListenPrice(uint _NewlistenPrice) public {
        require(owner == msg.sender, "not autorized");
        listenPrice = _NewlistenPrice;
    }

// Buy Nft
    function _buyNft(uint256 _tokenId, uint256 _price) public payable {
        require(_price == items[_tokenId].price, "invalid price");
        _transfer(ownerOf(_tokenId), msg.sender, _tokenId);
        sold[items[_tokenId].owner]++;
        items[_tokenId].owner = msg.sender;
        emit ItemEvent(_tokenId, _price, msg.sender);
    }
}
