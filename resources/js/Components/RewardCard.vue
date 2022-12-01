<template>
<div class="reward-card mt-2">
        <div class="first bg-card text-center reward-card-container">
            <h1 class="display-1 fw-bolder">{{index}}</h1>
            <h4 class="">{{name}}</h4>
            <ul>
                <li class="li-color">
                    <h6>Refferals investment</h6>
                   {{formatCurrency(investment)}} $
                </li>
                <li class="li-color">
                    <h6>Reward {{formatCurrency(amount)}} $</h6>
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
import Helpers from '@/Mixins/Helpers'
export default {
    props: ['name', 'investment', 'amount', 'index'],
    mixins: [Helpers]
}
</script>

<style>

</style>
