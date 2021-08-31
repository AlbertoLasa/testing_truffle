async function increase() {
  const oneWeek = (60 * 60 * 24 * 7) + 1;

  await web3.currentProvider.send({
    jsonrpc: "2.0",
    method: "evm_increaseTime",
    params: [oneWeek],
    id: new Date().getTime()
  }, () => {});
}

module.exports = {
  increase
}