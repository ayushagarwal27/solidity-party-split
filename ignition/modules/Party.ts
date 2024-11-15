// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const DEPOSIT_AMOUNT = 2000000000;

const PartyModule = buildModule("PartyModule", (m) => {
  const party = m.contract("Party", [DEPOSIT_AMOUNT]);
  return { party };
});

export default PartyModule;
