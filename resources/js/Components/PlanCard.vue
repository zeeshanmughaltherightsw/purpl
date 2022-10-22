<template>
     <div class="col-md-4 solution_cards_box">
            <div class="solution_card">
                <div class="ps-3">
                    <h3>{{ title }}</h3>
                    <span></span>
                </div>
                <h5 class="plan">{{ price }}</h5>
                <div class="solu_description">
                    <ul class="my-2">
                        <li class="" v-if="planType == 'Investors'">
                            <b>Estimated Profit</b>
                        </li>
                        <li v-if="planType == 'Investors'">
                           4% to 8%
                        </li>
                        <li v-if="planType == 'Refferals'">
                        <b>Refferals</b>
                        </li>
                        <li v-if="planType == 'Refferals'">
                       <li>{{reffer}}</li>
                        </li>
                        <li v-if="planType == 'Refferals'">
                        <b>Refferal Commission</b>
                        </li>
                        <li v-if="planType == 'Refferals'">
                        <li>{{commission}}</li>
                        </li>
                        <li>
                          <b>Amount Return</b>
                        </li>
                        <li>
                            14 Months
                        </li>
                    </ul>
                    <button type="button" class="read_more_btn my-3">Upgrade Now</button>
                </div>
            </div>
        </div>
        
</template>

<script>
export default{
    props: ['title', 'price', 'planType', 'reffer', 'commission']
}
</script>
