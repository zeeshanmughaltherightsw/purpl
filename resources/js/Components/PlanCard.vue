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
        <li v-if="planType == 'investor'">{{ profit }} %</li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferals</b>
        </li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          {{ minReffer }} to {{ maxReffer > 4 ? 'Unlimited' : maxReffer }}
        </li>
        <li v-if="planType == 'high_agent'">
          <b>With</b> <br />{{ max_price }} $
        </li>
        <li v-if="planType == 'referral' || planType == 'high_agent'">
          <b>Refferal Commission</b>
        </li>
        <li v-if="planType == 'referral'"></li>
        <li>{{ commission }}</li>

        <li v-if="planType == 'referral'">
          <b>Levels </b>
        </li>
        <li v-if="planType == 'referral'">
          {{ levels }} 
        </li>

        <li>
          <b>Plan Expiry</b>
        </li>
        <li>
        {{ parseFloat(expire) * 100}} % 
        </li>
      </ul>
      <Link :href="route('membership.index')" class="read_more_btn my-3">Upgrade Now</Link>
    </div>
  </div>
</template>
<script>
import { Link } from "@inertiajs/inertia-vue3";
export default {
  components: {
    Link
  },
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
    "expire",
    "levels"
  ],
};
</script>
