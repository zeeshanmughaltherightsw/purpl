<template>

  <div class="solution_card">
    <div class="ps-3">
      <h3>{{ title }}</h3>
      <span></span>
    </div>
    <h5 class="plan" v-if="planType == 'investor'">{{ price }}</h5>
    <div class="solu_description">
      <ul class="my-2">
        <li class="" v-if="planType == 'investor'">
          <b>Estimated Profit</b>
        </li>
        <li v-if="planType == 'investor'">{{ minProfit }} to {{ maxProfit }}</li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferals</b>
        </li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          {{ minReffer }} to {{ maxReffer }}
        </li>
        <li v-if="planType == 'high_agent'">
          <b>With</b> <br />{{ price }}
        </li>



        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferal Commission</b>
        </li>
        <li v-if="planType == 'referral'"></li>
        <li>{{ commission }}</li>

        <li v-if="planType == 'referral' || planType == 'high_agent' || planType == 'investor'">
          <b>Amount Return</b>
        </li>
        <li>
        {{ amountReturn }} Days
        </li>
      </ul>
      <button type="button" class="read_more_btn my-3">Upgrade Now</button>
    </div>
  </div>
</template>
<script>
export default {
  props: ["title", "price", "planType", "reffer", "commission", "minProfit", "maxProfit", "minReffer", "maxReffer" , "amountReturn"],
};
</script>
