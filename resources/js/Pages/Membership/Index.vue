<template>
    <authenticated-layout>
        <BreadCrumb title="Upgrade membership" />
        <div class="nk-content-body">
            <div class="buysell wide-xs m-auto">
                <div class="buysell-block">
                    <form action="#" class="buysell-form">
                        <div class="buysell-field form-group">
                            <div class="form-label-group">
                                <label class="form-label" for="buysell-amount">Amount</label>
                            </div>
                            <div class="form-control-group">
                                <input type="text" class="form-control form-control-lg form-control-number" id="buysell-amount"
                                    name="bs-amount" placeholder="0.055960">
                                <div class="form-dropdown">
                                    <div class="text">
                                        USDT
                                    </div>
                                </div>
                            </div>
                            <div class="form-note-group"><span class="buysell-min form-note-alt">
                                Minimum: 20.00 USD</span>
                                <span class="buysell-rate form-note-alt">1 USDT = 0.000016 BTC</span>
                            </div>
                        </div>
                        <!-- <div class="buysell-field form-group">
                            <div class="form-label-group"><label class="form-label">Payment Method</label></div>
                            <div class="form-pm-group">
                                <ul class="buysell-pm-list">
                                    <li class="buysell-pm-item"><input class="buysell-pm-control" type="radio"
                                            name="bs-method" id="pm-paypal"><label class="buysell-pm-label"
                                            for="pm-paypal"><span class="pm-name">PayPal</span><span class="pm-icon"><em
                                                    class="icon ni ni-paypal-alt"></em></span></label></li>
                                    <li class="buysell-pm-item"><input class="buysell-pm-control" type="radio"
                                            name="bs-method" id="pm-bank"><label class="buysell-pm-label"
                                            for="pm-bank"><span class="pm-name">Bank Transfer</span><span
                                                class="pm-icon"><em
                                                    class="icon ni ni-building-fill"></em></span></label></li>
                                    <li class="buysell-pm-item"><input class="buysell-pm-control" type="radio"
                                            name="bs-method" id="pm-card"><label class="buysell-pm-label"
                                            for="pm-card"><span class="pm-name">Credit / Debit Card</span><span
                                                class="pm-icon"><em class="icon ni ni-cc-alt-fill"></em></span></label>
                                    </li>
                                </ul>
                            </div>
                        </div> -->
                        <div class="buysell-field form-action">
                            <a class="btn btn-lg btn-block btn-primary" data-bs-toggle="modal" href="javascript:void(0)" @click="deposit">Deposit</a></div>
                        <div class="form-note text-base text-center">Note: our transfer fee included, 
                            <a href="#">see our fees</a>.</div>
                    </form>
                </div>
            </div>
        </div>
    </authenticated-layout>
</template>

<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
import { Head } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue'
import Helpers from '@/Mixins/Helpers'
export default {
    data(){
        return {
            account: null,
        }
    },
    components: { AuthenticatedLayout, Head, BreadCrumb },
    methods: {
        async deposit(){
            if (typeof window.ethereum == 'undefined') {
                NioApp.Toast('Please install metamask', 'danger')
            }

            var Contract = require('web3-eth-contract');
            // const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
            // this.account = accounts[0];
            // console.log(this.account)
            // const transactionParameters = {
            //     nonce: '0x00', // ignored by MetaMask
            //     to: '0x4e6ec31f1b774ee690ff5fdc2ec7f4ad371a8cab', // Required except during contract publications.
            //     from: ethereum.selectedAddress, // must match user's active address.
            //     value: '0x00', // Only required to send ether to the recipient from the initiating external account.
            //     data:'0xf5B2E602f412001d0F79099E8C5812897e677C2b', // Optional, but used for defining smart contract creation and interaction.
            // };

            // const txHash = await ethereum.request({
            //     method: 'eth_sendTransaction',
            //     params: [transactionParameters],
            // });
        }
    },
    mounted(){
       
    },
    mixins: [Helpers]
}
</script>

<style>

</style>