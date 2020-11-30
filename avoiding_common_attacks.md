Avoiding common attacks

PullPayments: used to avoid re-entracy attacks
    It also allows for thee use of an escrow account throughh which paymnts are routed from towards the artists-creators' addresses, so that the risk of receiving eether shifts from the contract to thee user. By using a pull function 
    we are able to avoid having a transaction cancelled due to, for example many users attempting to withdraw at once (for examplle the accumulated gas fees could be higher than what hte constract can pay). It also incentivises the users not to leave funds in the contract due to selling artwork.

Circuit Breaker: Pausable- 
    Used to be able to pause the contract - ideally a trigger for withdraw should be added as well 
    do that all artists who have uploaded and sold artefacts can receive their funds- but I did not have the time to implement. 



