<template>
    <Head title="Withdraw"/>
    <AuthenticatedLayout>
        <BreadCrumb title="Withdraw Methods">
            <template #plugin>
                <li>
                    <div class="form-control-wrap">
                        <div class="form-icon form-icon-right">
                            <em class="icon ni ni-search"></em>
                        </div>
                        <!-- <input type="text" class="form-control" id="default-04" placeholder="Search by name"> -->
                    </div>
                </li>
        </template>
        </BreadCrumb>
        <div class="nk-content bg-white">
            <div class="container-fluid">
                <div class="nk-content-inner">
                    <div class="nk-content-body">
                        <div class="components-preview wide-md mx-auto" v-if="gateways.length > 0">
                            <Table>
                                <template #head>
                                    <th class="tb-tnx-amount is-alt">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Name</span>
                                        </span>
                                    </th>
                                    <th class="tb-tnx-info">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Limit</span>
                                        </span>
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Charge</span>
                                        </span>
                                    </th>
                                    <th class="tb-tnx-amount is-alt">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span></span>
                                        </span>
                                    </th>
                                </template>
                                <template #body>
                                    <tr class="tb-tnx-item" v-for="(gateway, index) in gateways" :key="index">
                                        <td class="tb-tnx-amount is-alt">
                                            <div class="tb-tnx-status">
                                                <span class="badge badge-dot badge-info">{{ gateway.name }}</span>
                                            </div>
                                        </td>
                                        <td class="tb-tnx-info">
                                            <div class="tb-tnx-desc">
                                                <span class="title text-dark text-capitalize">{{ formatCurrency(gateway.single_currency.min_amount) + ' to ' + formatCurrency(gateway.single_currency.max_amount) }}</span>
                                            </div>
                                            <div class="tb-tnx-date">
                                                <span class="date">{{ formatCurrency(gateway.single_currency.fixed_charge) + ' + ' + gateway.single_currency.percentage_charge + '%' }}</span>
                                            </div>
                                        </td>
                                        <td class="">
                                            <button class="btn btn-primary" @click="openModal(gateway)">Withdraw Now</button>
                                        </td>
                                    </tr>
                                </template>
                            </Table>
                        </div>
                        <div v-else>
                            No Records Found
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <WithdrawModal />
    </AuthenticatedLayout>
</template>

<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
import { Head, useForm } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue'
import Helpers from '@/Mixins/Helpers'
import PrimaryButton from '@/Components/PrimaryButton';
import Table from '@/Components/BasicTable.vue'
import WithdrawModal from '@/Components/WithdrawModal.vue'
export default {
    props: ['gateways',],
    data(){
        return {
            account: null,
            amount: null,
            processing: false,
            showModal: false,
        }
    },
    components: { AuthenticatedLayout, Head, BreadCrumb, PrimaryButton, Table, WithdrawModal},
    methods: {
       openModal(gateway){
        this.emitter.emit('withdraw-modal', {
            gateway: gateway
        })
       }
    },
    mounted(){
        NioApp.BS.init()
    },
    mixins: [Helpers]
}
</script>

<style>

</style>