<template>
<Modal class="zoom">
    <div class="buysell-field form-group">
        <form @submit.prevent="submit" v-if="form">

            <div v-for="(input, index) in JSON.parse(gateway.input_form)" :key="index">
                <div class="form-label-group" >
                    <label class="form-label text-capitalize" for="buysell-amount">{{ input.field_name }}</label>
                </div>
                <div class="form-control-group">
                    <input 
                        :type="input.type" 
                        class="form-control" 
                        id="buysell-amount" 
                        :required="input.validation"
                        @input="form.input_form[index][input.field_name] = $event.target.files[0]"
                        v-if="input.type == 'file'"
                    />
                    <input v-else
                        :type="input.type" 
                        class="form-control" 
                        id="buysell-amount" 
                        v-model="form.input_form[index][input.field_name]" 
                        :required="input.validation"
                    />
                    <!-- <Error :message="form.input_form[input.field_name.replaceAll(' ', '_')].errors" /> -->
                </div>
            </div>

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
                        {{ curText() }}
                    </div>
                </div>
                <Error :message="form.errors.amount" />
            </div>
            <div class="form-group mt-2"><PrimaryButton type="submit" class="btn btn-lg btn-primary">Withdraw</PrimaryButton></div>
            <div class="form-note-group" v-if="gateway"><span class="buysell-min form-note-alt">
                Minimum: {{ formatCurrency(gateway.single_currency.min_amount) }}  {{ curText() }}</span>
                <span class="buysell-rate form-note-alt">1 {{ curText() }} = 1 {{ curText() }}</span>
            </div>
        </form>
    </div>
</Modal>
</template>
<script>
import Modal from '@/Components/Modal.vue'
import Helpers from '@/Mixins/Helpers'
import { useForm } from '@inertiajs/inertia-vue3'
import Error from '@/Components/InputError'
import PrimaryButton from '@/Components/PrimaryButton'
export default {
    data(){
        return {
            form: null,
            gateway: null,
        }
    },
    components: { Modal, Error, PrimaryButton },
    methods: {
        submit(){
            if(parseFloat(this.form.amount) < parseFloat(this.gateway.single_currency.min_amount)){
                NioApp.Toast('Amount can not be less than ' + this.gateway.single_currency.min_amount, 'error')
                return;
            }
            else if(parseFloat(this.form.amount) > parseFloat(this.gateway.single_currency.max_amount)){
                NioApp.Toast('Amount can not be greater than ' + parseFloat(this.gateway.single_currency.max_amount), 'error')
                return;
            }else if(parseFloat(this.form.amount) > parseFloat(this.$page.props.auth.user.profit)){
                NioApp.Toast('You do not have Sufficient balance', 'error')
                return;
            }
            this.form.post(route('withdraw.store'), {
                onSuccess: () => {
                    this.form.reset();
                    NioApp.Toast('Withdraw Request sent!', 'success')
                    $('#genericModal').modal('hide');
                },
                onError: (e) => {
                    console.log(e)
                    NioApp.Toast(Object.values(e)[0], 'error')
                }
            })
           
        }
    },
    beforeMount(){
        this.emitter.on('withdraw-modal', (args) => {
            this.gateway = args.gateway
            this.form = useForm({
                amount: 0,
                id: args.gateway.single_currency.id,
                input_form: []
            });
            JSON.parse(args.gateway.input_form).forEach((value) => {
                let form = new Object()
                form[value.field_name] = null
                this.form.input_form.push(form);
            })
            NioApp.BS.tabfix(null, '#genericModal', 1)
            
        })
    },
    mixins: [Helpers]
}
</script>