<template>

  <div class="solution_card">
    <div class="ps-3">
      <h3>{{ title }}</h3>
      <span></span>
    </div>
    <h5 class="plan" v-if="planType == 'investor'">{{ parseInt(min_price).toFixed(0) }} to {{ parseInt(max_price).toFixed(0) }} $</h5>
    <div class="solu_description">
      <ul class="my-2">
        <li class="" v-if="planType == 'investor'">
          <b>Estimated Profit</b>
        </li>
        <li v-if="planType == 'investor'">{{ profit }} $</li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferals</b>
        </li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          {{ minReffer }} to {{ maxReffer }}
        </li>
        <li v-if="planType == 'high_agent'">
          <b>With</b> <br />{{ max_price }} $
        </li>



        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferal Commission</b>
        </li>
        <li v-if="planType == 'referral'"></li>
        <li>{{ commission }}</li>

        <li>
          <b>Plan Expiry</b>
        </li>
        <li>
        {{ parseFloat(expire) * 100}} % 
        </li>
      </ul>
      <button type="button" class="read_more_btn my-3">Upgrade Now</button>
    </div>
  </div>
</template>
<script>
export default {
  props: [
    "title", 
    "min_price", 
    "max_price", 
    "planType", 
    "reffer", 
    "commission", 
    "profit", 
    "minReffer", 
    "maxReffer" , 
    "expire"
  ],
};
</script>
