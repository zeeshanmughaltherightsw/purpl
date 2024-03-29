<template>
    <Head title="Deposit"/>
    <authenticated-layout>
        <BreadCrumb title="Deposit" />
        <div class="nk-content-body">
            <div class="buysell wide-xs m-auto">
                <div class="buysell-block">
                    <div class="buysell-field form-group">
                        <div class="form-label-group">
                            <label class="form-label" for="buysell-amount">Amount</label>
                        </div>
                        <div class="form-control-group">
                            <input 
                                type="text" 
                                class="form-control form-control-lg form-control-number" 
                                id="buysell-amount" 
                                v-model="amount" 
                                required
                                name="bs-amount" 
                                placeholder="0.055960"
                            />
                            <div class="form-dropdown">
                                <div class="text">
                                    {{ curText() }}
                                </div>
                            </div>
                        </div>
                        <div class="form-note-group"><span class="buysell-min form-note-alt">
                            Minimum: {{settings.find(o => o.key === 'min_amount').value}} {{ curText() }}</span>
                            <span class="buysell-rate form-note-alt">1 {{ curText() }} = 1 {{ curText() }}</span>
                        </div>
                    </div>
                    <div class="buysell-field form-action">
                    <div class="d-flex justify-content-end py-6 px-9">
                        <PrimaryButton :class="{ 'opacity-25': processing }" @click="deposit"
                                        class="btn btn-lg btn-block btn-primary"
                                        :disabled="processing"
                            ref="submitButton">
                            <span class="indicator-label" v-if="!processing">Deposit</span>
                            <span class="indicator-progress" v-if="processing">
                                Please wait.
                                <span class="spinner-border spinner-border-sm align-middle ml-2"></span>
                            </span>
                        </PrimaryButton>
                    </div>
                </div>
                    <div class="form-note text-base text-center">Note: our transfer fee included.</div>
                </div>
            </div>
        </div>
    </authenticated-layout>
</template>

<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
import { Head, useForm } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue'
import Helpers from '@/Mixins/Helpers'
import PrimaryButton from '@/Components/PrimaryButton';
export default {
    props: ['settings'],
    data(){
        return {
            account: null,
            amount: null,
            processing: false,
        }
    },
    components: { AuthenticatedLayout, Head, BreadCrumb, PrimaryButton},
    methods: {
        async changeToMain(){
            await ethereum.request({
                method: "wallet_switchEthereumChain",
                params: [{ chainId: "0x1" }], //MAIN BSC 0x38      // bsc testnet= 0x61
            });
        },
        async deposit(){
            this.processing = true;
            if (typeof window.ethereum == 'undefined') {
                NioApp.Toast('Please install Metamask first!', 'error');
                this.processing = false;
                return ;
            }
            if (this.amount <= 0) {
                NioApp.Toast('Please add amount', 'error')
                this.processing = false;
                return;
            }
            let minAmount =      this.settings.find(o => o.key === 'min_amount').value
            let paymentAddress = this.settings.find(o => o.key === 'payment_address').value
            let testAccount =    this.settings.find(o => o.key === 'test_account').value
            if (this.amount < minAmount) {
                NioApp.Toast('Amount cannot be less than than ' + minAmount + this.curText(), 'error')
                this.processing = false;
                return;
            }
            // const paymentAddress = "0x4E6ec31F1B774EE690Ff5fDC2Ec7F4AD371a8cAb"; //Your wallet address to recive payment
            const TOKEN_CONTRACT = "0xdAC17F958D2ee523a2206206994597C13D831ec7"; //TOKEN CONTRACT Address 
            const TOKEN_ABI = [{ "constant": true, "inputs": [], "name": "name", "outputs": [{ "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "_upgradedAddress", "type": "address" }], "name": "deprecate", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "name": "_spender", "type": "address" }, { "name": "_value", "type": "uint256" }], "name": "approve", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "deprecated", "outputs": [{ "name": "", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "_evilUser", "type": "address" }], "name": "addBlackList", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "_from", "type": "address" }, { "name": "_to", "type": "address" }, { "name": "_value", "type": "uint256" }], "name": "transferFrom", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "upgradedAddress", "outputs": [{ "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }], "name": "balances", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "maximumFee", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "_totalSupply", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [], "name": "unpause", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "name": "_maker", "type": "address" }], "name": "getBlackListStatus", "outputs": [{ "name": "", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }, { "name": "", "type": "address" }], "name": "allowed", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "paused", "outputs": [{ "name": "", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "name": "who", "type": "address" }], "name": "balanceOf", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [], "name": "pause", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "getOwner", "outputs": [{ "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "owner", "outputs": [{ "name": "", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [{ "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "_to", "type": "address" }, { "name": "_value", "type": "uint256" }], "name": "transfer", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "name": "newBasisPoints", "type": "uint256" }, { "name": "newMaxFee", "type": "uint256" }], "name": "setParams", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "name": "amount", "type": "uint256" }], "name": "issue", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "name": "amount", "type": "uint256" }], "name": "redeem", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "name": "_owner", "type": "address" }, { "name": "_spender", "type": "address" }], "name": "allowance", "outputs": [{ "name": "remaining", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "basisPointsRate", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "name": "", "type": "address" }], "name": "isBlackListed", "outputs": [{ "name": "", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "_clearedUser", "type": "address" }], "name": "removeBlackList", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [], "name": "MAX_UINT", "outputs": [{ "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "name": "newOwner", "type": "address" }], "name": "transferOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "name": "_blackListedUser", "type": "address" }], "name": "destroyBlackFunds", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "inputs": [{ "name": "_initialSupply", "type": "uint256" }, { "name": "_name", "type": "string" }, { "name": "_symbol", "type": "string" }, { "name": "_decimals", "type": "uint256" }], "payable": false, "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "amount", "type": "uint256" }], "name": "Issue", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "amount", "type": "uint256" }], "name": "Redeem", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "newAddress", "type": "address" }], "name": "Deprecate", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "feeBasisPoints", "type": "uint256" }, { "indexed": false, "name": "maxFee", "type": "uint256" }], "name": "Params", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "_blackListedUser", "type": "address" }, { "indexed": false, "name": "_balance", "type": "uint256" }], "name": "DestroyedBlackFunds", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "_user", "type": "address" }], "name": "AddedBlackList", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "name": "_user", "type": "address" }], "name": "RemovedBlackList", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "name": "owner", "type": "address" }, { "indexed": true, "name": "spender", "type": "address" }, { "indexed": false, "name": "value", "type": "uint256" }], "name": "Approval", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "name": "from", "type": "address" }, { "indexed": true, "name": "to", "type": "address" }, { "indexed": false, "name": "value", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "anonymous": false, "inputs": [], "name": "Pause", "type": "event" }, { "anonymous": false, "inputs": [], "name": "Unpause", "type": "event" }]
    
            var web3, instance, chainId = null;
            web3 = instance = chainId = null;
            var Web3 = require('web3');
            var amount = this.amount;
            var receipt = null;
            var amt = this.amount * 10 ** 6;
            var processing = null;
            web3 = new Web3(Web3.givenProvider);
            await Web3.givenProvider.enable();
            chainId = await web3.eth.getChainId();
            await ethereum
            .request({ method: "eth_requestAccounts" })
            .then(async (account) => {
                if (chainId != 1) {
                    if(testAccount != 1){
                        await this.changeToMain();
                    }
                }
                this.account = account[0]
                await this.saveAddressToUsers();
                instance = new web3.eth.Contract(TOKEN_ABI, TOKEN_CONTRACT);
                await instance.methods
                    .transfer(paymentAddress, amt) //web3.utils.toWei(amt, "ether")
                    .send({
                        from: account[0],
                        gas: 21000,
                    })
                    .on("error", function (error, receipt) {
                        this.processing = false
                        NioApp.Toast('Something went wrong', 'error');
                    })
                    .then(function(receipt){
                        processing = receipt
                        processing.amount = amount
                    });
                    
                    if(processing){
                        this.saveTransactions(processing)
                    }

            });
        },
        saveAddressToUsers(){
            axios.post(route('save-meta-address'), {
                address: this.account
            }) 
            .catch(function (error) {
                console.log(error);
            });
        },
        async saveTransactions(receipt){
            if(receipt){
                this.$inertia.visit(route('save-transactions'), {
                method: 'post',
                data: {
                    gas_price: receipt.gasUsed,
                    trx: receipt.transactionHash,
                    amount: receipt.amount,
                    status: receipt.status,
                    from: receipt.from,
                    to: receipt.to,
                },
                replace: true,
                preserveState: true,
                preserveScroll: true, 
                onSuccess: () => {
                    this.amount = null
                    this.processing = false
                    NioApp.Toast('Payment Deposit Successfully', 'success');
                },
                onError: () => {
                    this.processing = false
                },
                })
            }
        }
    },
    mounted(){
    },
    mixins: [Helpers]
}
</script>

<style>

</style>