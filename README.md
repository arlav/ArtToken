ART TOKEN PROJECT v0.03



License: MIT
The project is an ERC721 Token marketplace, where artists can upload their digital art, tokenise it with ERC721 and sell it.
The front-end interface is based on vue.js while the decentralised storage of files uses IPFS
It re-uses code from OpenZeppelin, specifically:

the ERC721 contract for the ERC721 and token implementation (0.6.2)
the PullPayment contract to bypass the re-entrance security issue 
the Ownable contract to allow for ownership of the contract and a circuit breaker pattern implementation.

It has used the guide "NFT ERC721 Digital Art" by Bernard3000
(https://github.com/bernhard3000/nft-digital-marketplace)

The project has been developed on MacOS and to work with it / replicate it you need to

Install Truffle (https://www.trufflesuite.com/)
Install Ganache (https://www.trufflesuite.com/ganache)
Install node (https://nodejs.org/en/download/)
Install Vue.js (npm install -g @vue/cli@latest)
Install Ether.js ( npm install --save ethers)
Install IPFS (npm install --save ipfs-http-client)

You will also need a browser that runs Metamask.io and for Metamask.io to be properly set up and connected to the network where the project is launched.

You will also need to set particular configurations on your IPFS config file to allow vue.js to access it.
A copy of the config file has been included in the project. Use that if you get a cross-origins request
when you try to publih the art (your IPFS config lives in ~/.ipfs/comnfig). Alternatively use another address for IPFS (for example 0.0.0.0)

**TRUFFLE CONFIGURATION**
use solidity 0.6.2
use ganache localy, with 7545 port.

**To Run the project:**

1.Launch Ganache first- Add  the Truffle-config.js from the project

2.in a terminal navigate to the /client directory and execute :$ npm run serve

3.in a second terminal launch IPFS daemon:$ ipfs daemon or launch your IPFS desktop

4.on a browser with metamask navigate to http://localhost:3000

5.have an image file ready to upload





### to Customize the vue.js configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
