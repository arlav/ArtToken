//SPDX-License-Identifier: MIT

pragma solidity ^0.6.2;

//for @Arlav on Sunday: Circuit Breaker pattern, comments per spec, tests!

//importing the ERC721 token contract to use as template
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/payment/PullPayment.sol";


contract ArtToken is ERC721, Ownable, PullPayment {

  uint256 public _tokenIds;
  uint256 public _artItemIds;
  mapping (uint256 => ArtItem) private _artItems;



  struct ArtItem {
    address seller;
    uint256 price;
    string tokenURI;
    bool exists;

  }

  constructor() ERC721("ArtToken", "ART") public {}

  modifier artItemExist(uint256 id) {
    require(_artItems[id].exists, "Not Found");
    _;
  }

  function addArtItem(uint256 price, string memory tokenURI) public {
    require(price > 0, "Price can not be 0");
    _artItemIds++;
    _artItems[_artItemIds] = ArtItem(msg.sender, price, tokenURI, true);

  }

  function getArtItem(uint256 id) public view artItemExist(id) returns(uint256,uint256, string memory){
    ArtItem memory artItem = _artItems[id];
    return (id, artItem.price, artItem.tokenURI);
  }

  function purchaseArtItem(uint256 artItemid) external payable artItemExist(artItemid) {
    ArtItem storage artItem = _artItems[artItemid];

    require(msg.value >= artItem.price, "Your bid is too low");

    _tokenIds++;

    _safeMint(msg.sender, _tokenIds);
    _setTokenURI(_tokenIds, artItem.tokenURI);
    _asyncTransfer(artItem.seller, msg.value);
  }

  function getPayments() external {
    withdrawPayments(msg.sender);

  }



}
