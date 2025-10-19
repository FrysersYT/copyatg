// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTGift is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) private _tokenURIs;

    event Minted(address indexed to, uint256 tokenId, string uri);

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

    // Public mint function — anyone can mint (demo). You can restrict later.
    function mint(address to, string calldata tokenURI_) external returns (uint256) {
        uint256 tokenId = nextTokenId;
        nextTokenId += 1;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI_);
        emit Minted(to, tokenId, tokenURI_);
        return tokenId;
    }

    // internal setter for tokenURI
    function _setTokenURI(uint256 tokenId, string memory _uri) internal {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = _uri;
    }

    // view tokenURI
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "URI query for nonexistent token");
        string memory _uri = _tokenURIs[tokenId];
        return _uri;
    }
}
