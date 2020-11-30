
design patterns used:

ERC721
    This is the backbone of the contract. The actual token is implemented as a struct that contains an IPFS URI. In the past I have designed a similar function where IPFS is connectd with the ethereum contract via a string, where the IPFS has is inserted but this complicates design of the user interface. The original stretch goal, which I hope I can implement after this, is a marktplace & 3d game where the ArtTokens visualisations use 3d models in a webVR fashion, and there the token definition defines the generatino of the model, i.e a kind of open ended cryptokitties in 3d.

Pausable
    Contract is pausable, all function incorporate the modifier whenNotPaused. - User interface does not implement a pause function but the pause is addressable through direct call to the contract

    The contract implements a seri of functions and a struct that acts as the token generator. ArtWork is uploaded to IPF but only ERC721-tokenised when sold, bringing economy to fees and transactions. Functions are the AddArtItem, that ass the art, a GetArtItem, a Purchase ArtItem, and a withdrawal function. A modifier checks if the artwork exists and istriggered when an item is purchased or recalled from IPFS. 

    Still to implement: trransfer the wholee contract to a new onwer, multi-owner and admin functionality, withdrawl to escrow for all addrresses that have sold artwork.


Ownable
    Allows the contract to be paused - Ideally an additional design feature should be to transfer the whole contract to another owner who will act as custodian of the contract- again, not enoughh time to implement it now.


PullPayment (to avoid re-entrancy)
    This is used to avoid reentrancy, it introduces a feature or burden for the user: Funds are withdrawn to an escrow account from which the user needs to withdraw taking responsibility for the transfer, rather than triggering multiple transfers through one action in the contract, towards the user's accounts. 


