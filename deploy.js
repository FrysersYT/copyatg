async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying from", deployer.address);

  const NFT = await ethers.getContractFactory("NFTGift");
  const nft = await NFT.deploy("NFTGiftDemo", "GIFT");
  await nft.deployed();

  console.log("NFTGift deployed to:", nft.address);
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
