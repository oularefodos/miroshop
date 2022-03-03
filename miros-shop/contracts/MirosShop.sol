//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import '@openzeppelin/contracts/utils/Counters.sol';


contract MirosShop is ERC721URIStorage {

// structur of Item

    struct item {
        uint256 tokenId;
        uint storeId;
        uint256 price;
        address owner;
    }
// structure of store

    struct store {
        address owner;
        string name;
        string profileImg;
        string coverImg;
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address owner;
    uint256 listenPrice = 0.01 ether;
    item[] public items;
    mapping (address => uint256) n_sotre;

    event ItemEvent(uint256 tokenId, uint256 price, address owner);

    constructor() ERC721("Miros", "MRS") {
        owner = msg.sender;
    }

// create Store

    function createStore(string memory _name, string memory _pimg, string memory _cimg) public{
        require(n_store < 6, "max store");
        store(
            msg.sender,
            _name,
            _pimg,
            _cimg,
        );
        n_store[msg.sender]++;
    }

// create Nft
    function _creatNft(string memory _metadata, uint256  _price, uint256 _listenPrice) public payable {
        uint256 NewId = _tokenIds.current();
        _safeMint(msg.sender, NewId);
        _setTokenURI(NewId, _metadata);
        _createItem(NewId, _price, _listenPrice);
        _tokenIds.increment();
        emit ItemEvent(NewId, _price, msg.sender);
    }

    function _createItem (uint256  _tokenId, uint256 _price, uint256 _listenprice) internal {
        require(_listenprice == listenPrice, "invalid price");
        items[_tokenId] = item (
          _tokenId,
          storeId,
          _price,
          msg.sender
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
        _transfer(items[_tokenId].owner, msg.sender, _tokenId);
        items[_tokenId].owner = msg.sender;
        emit ItemEvent(_tokenId, _price, msg.sender);
    }
}
