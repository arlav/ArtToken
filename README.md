ARTTOKEN PROJECT v0.03

todo:
Finish commenting ArtToken
Finish Test
Migrate to opsten / Rinkeby
update repository
submit.

License: MIT
The project is an ERC721 Token marketplace, where artists can upload their digital art, tokenise it with ERC721 and sell it.
The frontend interface is based on vue.js while the decentralised storage of files uses IPFS
It re-uses code from OpenZeppelin, specifically:

the ERC721 contract for the ERC721 and token implementation
the PullPayment contract to bypass the re-ntrance security issue
the Ownable contact to allow for ownership of the contract and a circuit breaker pattern implementation.

It has used the guide "NFT ERC721 Digital Art" by Bernard3000
(https://github.com/bernhard3000/nft-digital-marketplace)

The project has been developed on MacOS and work with it / rerplicate it you need to 

Install Truffle (https://www.trufflesuite.com/)
Install Ganache (https://www.trufflesuite.com/ganache)
Install node (https://nodejs.org/en/download/)
Install Vue.js (npm install -g @vue/cli@latest)
Install Ether.js ( npm install --save ethers)
Install IPFS (npm install --save ipfs-http-client)

You will also need a browser that runs metamask and for metamask to be properly set up.

You will also need to set particular configurations on your IPFS config file to allow vue.js to access it.
A copy of the config file has been included in the project. Use that if you get a cross-oigins request 
wheen you try to publih the art(your IPFS config lives in ~/.ipfs/comnfig). Alternatively use another address for IPFS (for example 0.0.0.0)

**TRUFFLE CONFIGURATION**
use solidity 0.6.2 
use ganache localy, with 7545 port. 

**To Run the project:**

1.Launch Ganache first- Add thfrom the Truffle-config.js from the project

2.in a terminal navigqte to the /client directory and execute :$ npm run serve

3.in a second terminal launch IPFS daemon:$ ipfs daemon

4.on a browser with metamask navigate to http://localhost:3000

5.have an image file ready to upload 





### to Customize the vue.js configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
