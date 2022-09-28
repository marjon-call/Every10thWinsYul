# Every10thWinsYul
A smart contract game entirely written in Yul! The 10th player to "call" the contract wins all of the ether in the contract. The one caveat is a user can pay extra ether to "call" the contract twice.

The contract is deployed to the Goerli network if you want to play!
Contract address: 0x3679AE9F0cF34bA0e1a583Cb53477e602A8B8d5b
Etherscan: https://goerli.etherscan.io/address/0x3679ae9f0cf34ba0e1a583cb53477e602a8b8d5b

Rules:
- Call playGame() (function selector: 0xaf899735) and send 1 ether to "call" the contract once.
- Call playSmart() (function selector: 0xca53d32d) and send 3 ether to "call" the contract twice.
- The tenth caller wins the contract's ether!
- But if the the amount of calls goes over 10, the contract starts over at 0 calls.
