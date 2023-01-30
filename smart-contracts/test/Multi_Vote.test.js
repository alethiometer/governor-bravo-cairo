// Right click on the script name and hit "Run" to execute
const { expect } = require("chai");
const { ethers } = require("hardhat");

let multi_vote;
let addr1;
let addr2;
let addr3;

describe("Multi_Vote", () => {
  
  beforeEach(async () => {
    [addr1, addr2, addr3] = await ethers.getSigners();
    const Multi_Vote = await ethers.getContractFactory("Multi_Vote");
    multi_vote = await Multi_Vote.deploy(1000);
    await multi_vote.deployed();
    console.log('storage deployed at:'+ multi_vote.address)
  });

  it("state set correctly", async () => {
        //test global variables
        expect(await get_total_supply()).to.equal(1000);
        expect(await get_vote_in_progress()).to.equal(false);

        //test current vote
        expect(await get_curr_proposal()).to.equal(0);
        expect(await get_proposal_pro(0)).to.equal(0);
        expect(await get_proposal_against(0)).to.equal(0);
        expect(await get_proposal_abstain(0)).to.equal(0);
        expect(await get_proposal_result(0)).to.equal(0);


        //test user vote amounts
        expect(await get_vote_amount(0, addr1.address)).to.equal(0);
        expect(await get_vote_amount(0, addr2.address)).to.equal(0);
        expect(await get_vote_amount(0, addr3.address)).to.equal(0);


        //test user positions
        expect(await get_vote_position(0, addr3.address)).to.equal(0);
        expect(await get_vote_position(0, addr2.address)).to.equal(0);
        expect(await get_vote_position(0, addr1.address)).to.equal(0);


        //test user balance
        expect(await get_user_total_balance(addr1.address)).to.equal(1000);
        expect(await get_user_total_balance(addr2.address)).to.equal(0);
        expect(await get_user_total_balance(addr3.address)).to.equal(0);

        //test user availible
        expect(await get_user_total_availible(addr1.address)).to.equal(1000);
        expect(await get_user_total_availible(addr2.address)).to.equal(0);
        expect(await get_user_total_availible(addr3.address)).to.equal(0);


        //test user power 
        expect(await get_user_total_power(addr1.address)).to.equal(0);
        expect(await get_user_total_power(addr2.address)).to.equal(0);
        expect(await get_user_total_power(addr3.address)).to.equal(0);



        //test delgated map
        expect(await get_user_delgated_amount(addr1.address, addr1.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr1.address, addr2.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr1.address, addr3.address)).to.equal(0);

        expect(await get_user_delgated_amount(addr2.address, addr1.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr2.address, addr2.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr2.address, addr3.address)).to.equal(0);

        expect(await get_user_delgated_amount(addr3.address, addr1.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr3.address, addr2.address)).to.equal(0);
        expect(await get_user_delgated_amount(addr3.address, addr3.address)).to.equal(0);
  });

});


async function get_total_supply() {
    return await multi_vote.get_total_supply();
}

async function get_vote_in_progress() {
    return await multi_vote.get_vote_in_progress();
}

async function get_curr_proposal() {
    return await multi_vote.get_curr_proposal();
}

async function get_proposal_pro(proposal) {
    return await multi_vote.get_proposal_pro(proposal);
}

async function get_proposal_against(proposal) {
    return await multi_vote.get_proposal_against(proposal);
}

async function get_proposal_abstain(proposal) {
    return await multi_vote.get_proposal_abstain(proposal);
}

async function get_proposal_result(proposal) {
    return await multi_vote.get_proposal_result(proposal);
}

async function get_vote_amount(proposal, voter) {
    return await multi_vote.get_vote_position(proposal, voter);
}

async function get_vote_position(proposal, voter) {
    return await multi_vote.get_vote_position(proposal, voter);
}

async function get_user_total_balance(user) {
    return await multi_vote.get_user_total_balance(user);
}

async function get_user_total_availible(user) {
    return await multi_vote.get_user_total_availible(user);
}

async function get_user_total_power(user) {
    return await multi_vote.get_user_total_power(user);
}

async function get_user_delgated_amount(user, delegatee) {
    return await multi_vote.get_user_delgated_amount(user, delegatee);
}