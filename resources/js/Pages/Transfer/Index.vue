<template>
    <Head title="Transfer Balance"/>
    <authenticated-layout>
        <BreadCrumb title="Transfer Balance" />
        <div class="nk-content-body">
            <div class="buysell wide-xs m-auto">
                <form @submit.prevent="submit" v-if="form">
                    <div class="buysell-block">
                        <div class="form-label-group" >
                            <label class="form-label text-capitalize" for="buysell-amount">Username</label>
                        </div>
                        <div class="form-control-group">
                            <input 
                                type="text" 
                                class="form-control" 
                                id="buysell-amount" 
                                v-model="form.username" 
                                placeholder="Username"
                                required 
                            />
                            <errors :message="form.errors.username" />
                        </div>
                        <div class="buysell-field form-group">
                            <div class="form-label-group">
                                <label class="form-label" for="buysell-amount">Amount</label>
                            </div>
                            <div class="form-control-group">
                                <input 
                                    type="text" 
                                    class="form-control form-control-lg form-control-number" 
                                    id="buysell-amount" 
                                    v-model="form.amount" 
                                    required
                                    name="bs-amount" 
                                    placeholder="0.055960"
                                />
                                <div class="form-dropdown">
                                    <div class="text">
                                        USDT
                                    </div>
                                </div>
                                <errors :message="form.errors.amount"/>
                            </div>
                            <div class="form-note-group"><span class="buysell-min form-note-alt">
                                Minimum: 20$ USDT</span>
                                <span class="buysell-rate form-note-alt">1 USDT = 1 USD</span>
                            </div>
                        </div>
                        <div class="buysell-field form-action">
                            <div class="d-flex justify-content-end py-6 px-9">
                                <PrimaryButton :class="{ 'opacity-25': form.processing }" 
                                                class="btn btn-lg btn-block btn-primary"
                                                :disabled="form.processing"
                                    ref="submitButton">
                                    <span class="indicator-label" v-if="!form.processing">Transfer</span>
                                    <span class="indicator-progress" v-if="form.processing">
                                        Please wait.
                                        <span class="spinner-border spinner-border-sm align-middle ml-2"></span>
                                    </span>
                                </PrimaryButton>
                            </div>
                        </div>
                        <div class="form-note text-base text-center">Note: our 5% transfer fee included.</div>
                    </div>
                </form>
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
import Errors from '@/Components/InputError'

export default {
    props: ['settings'],
    data(){
        return {
            form: null,
        }
    },
    components: { AuthenticatedLayout, Head, BreadCrumb, PrimaryButton, Errors},
    methods: {
        submit(){
            if(parseFloat(this.form.amount) > parseFloat(this.$page.props.auth.user.profit)){
                NioApp.Toast('You do not have Sufficient balance', 'error')
                return;
            }
            this.form.post(route('transfer.store'), {
                onSuccess: () => {
                    this.form.reset();
                    NioApp.Toast('Balance Transfered Successfully', 'success')
                },
                onError: (e) => {
                    NioApp.Toast(Object.values(e)[0], 'error')
                }
            });
        }
    },
    mounted(){
        this.form = useForm({
            username: null,
            amount: null
        })
    },
    mixins: [Helpers]
}
</script>

<style>

</style>