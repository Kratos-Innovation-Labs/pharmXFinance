# pharmX Token Contract

## Description

pharmX is an ERC20 token contract implemented on the Ethereum blockchain. It provides functionalities for token transfers, minting new tokens, and uploading proofs associated with specific orders.

## Contract Details

- **Name:** pharmX Token
- **Symbol:** PHX
- **Total Supply:** 1,000,000 PHX
- **Mint Price:** 0.0001 Ether per token (have not included functionality to change this once the contract is deployed. Please set the price before deploying.
- 
  ---

## Contract Functions

1. **transfer:** Allows token holders to transfer tokens to other addresses.

2. **mint:** Allows the contract owner to mint new tokens by sending Ether. Requires specifying the recipient's address and the amount of tokens to mint. Ensures that the total supply does not exceed the maximum supply limit.

3. **uploadProof:** Allows users to upload proofs associated with specific orders. Requires specifying the order ID and the proof data. Make sure to upload only the CID, and not the whole IPFS link. 
             For example: if the proof is stored at [https://ipfs.io/ipfs/bafybeih6oo2m52hov77gfzjndsp6o7tczur6iiajd7zvwvfneswnly5g5q](https://ipfs.io/ipfs/bafybeih6oo2m52hov77gfzjndsp6o7tczur6iiajd7zvwvfneswnly5g5q), the function parameters should only be uploadProof(100,"bafybeih6oo2m52hov77gfzjndsp6o7tczur6iiajd7zvwvfneswnly5g5q")(100 is a sample orderId)
 

4. **getIpfsHash:** Retrieves the IPFS hashes of proofs uploaded for a particular order ID.

Note: One orderId can store multiple proofs. They can be queried using the getIpfsHash() function, which returns a string of all the ipfs hashes of the orderId, directly with the IPFS links.

## Usage

Deploy the contract to the Ethereum blockchain.

The contract owner can mint new tokens by sending Ether using the mint function.

Token holders can transfer tokens to other addresses using the transfer function.

Users can upload proofs for their orders using the uploadProof function.

Retrieve the IPFS hashes of proofs uploaded for specific order IDs using the getIpfsHash function.




