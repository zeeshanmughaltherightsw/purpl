<template>
  <div class="nk-sidebar nk-sidebar-fixed is-light" data-content="sidebarMenu">
    <div class="nk-sidebar-element nk-sidebar-head">
      <div class="nk-sidebar-brand">
        <Link :href="route('dashboard')" class="logo-link nk-sidebar-logo">
        <img class="logo-light logo-img" src="logo.png" srcset="logo.png" alt="logo" />
        </Link>
      </div>
      <div class="nk-menu-trigger mr-n2">
        <a href="#" class="nk-nav-toggle nk-quick-nav-icon d-xl-none" data-target="sidebarMenu"><em
            class="icon ni ni-arrow-left" @click="hideSidebar"></em></a>
        <a href="#" class="nk-nav-compact nk-quick-nav-icon d-none d-xl-inline-flex" @click="hideSidebar" data-target="sidebarMenu"><em
            class="icon ni ni-menu"></em></a>
      </div>
    </div>
    <!-- .nk-sidebar-element -->
    <div class="nk-sidebar-element">
      <div class="nk-sidebar-content" scroll-region>
       
        <div class="nk-sidebar-menu" data-simplebar>
          <ul class="nk-menu" scroll-region>
            <li class="nk-sidebar-widget d-none d-xl-block px-5">
              <div class="user-account-info between-center">
                <div class="user-account-main">
                  <h6 class="overline-title-alt">Available Balance</h6>
                  <div class="user-balance">{{ formatCurrency($page.props.auth.user.investment) }}<small class="currency currency-btc">USDT</small></div>
                </div><a href="#" class="btn btn-white btn-icon btn-light"><em class="icon ni ni-line-chart"></em></a>
              </div>
              <ul class="user-account-data gy-1">
                <li>
                  <div class="user-account-label"><span class="sub-text">Withdrawable Amount</span></div>
                  <div class="user-account-value"><span class="sub-text">{{ formatCurrency($page.props.auth.user.profit) }}<span
                        class="currency currency-btc">USDT</span></span></div>
                </li>
              </ul>
              <div class="user-account-actions">
                <ul class="g-3">
                  <li>
                    <Link :href="route('deposit.index')" class="btn btn-lg btn-primary"><span>Deposit</span></Link>
                  </li>
                  <li>
                    <Link :href="route('withdraw.index')" class="btn btn-lg btn-primary"><span>Withdraw</span></Link>
                  </li>
                  <!-- <li><a href="#" class="btn btn-lg btn-warning"><span>Withdraw</span></a></li> -->
                </ul>
              </div>
            </li>
            <li class="nk-menu-item" :class="{ 'active current-page': route().current('dashboard') }">
              <Link preserve-scroll :href="route('dashboard')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-dashboard"></em></span>
              <span class="nk-menu-text">Dashboard</span>
              </Link>
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item" :class="{ 'active current-page': route().current('profile') }">
              <Link preserve-scroll :href="route('profile')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-user-c"></em></span>
              <span class="nk-menu-text">Profile</span>
              </Link>
            </li>
            <!-- .nk-menu-item -->
            <!-- .nk-menu-item -->
            <li class="nk-menu-item" :class="{ 'active current-page': route().current('membership.index') }">
              <Link preserve-scroll :href="route('membership.index')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-chevron-up-round"></em></span>
              <span class="nk-menu-text">Upgrade Membership</span>
              </Link>
            </li>

            <li class="nk-menu-item" :class="{ 'active current-page': route().current('direct-referrals') }">
              <Link preserve-scroll :href="route('direct-referrals')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-user-round"></em></span>
              <span class="nk-menu-text">Direct Referrals</span>
              </Link>
            </li>
            <li class="nk-menu-item" :class="{ 'active current-page': route().current('uni-level') }">
              <Link preserve-scroll :href="route('uni-level')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-globe"></em></span>
              <span class="nk-menu-text">All Referrals</span>
              </Link>
            </li>
            <li v-if="$page.props.auth.user.investment > 0" class="nk-menu-item"
              :class="{ 'active current-page': route().current('referral-link') }">
              <Link preserve-scroll :href="route('referral-link')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-link-group"></em></span>
              <span class="nk-menu-text">Referral link</span></Link>
            </li>

            <li class="nk-menu-item" :class="{ 'active current-page': route().current('transactions') }">
              <Link preserve-scroll :href="route('transactions')" class="nk-menu-link">
              <span class="nk-menu-icon"><em class="icon ni ni-tranx"></em></span>
              <span class="nk-menu-text">Transactions</span>
              </Link>
            </li>
          </ul>
          <!-- .nk-menu -->
        </div>
        <!-- .nk-sidebar-menu -->
      </div>
      <!-- .nk-sidebar-content -->
    </div>
    <!-- .nk-sidebar-element -->
  </div>
</template>
<script>
import Helpers from "@/Mixins/Helpers";
import { Link } from "@inertiajs/inertia-vue3";
export default {
  components: { Link },
  methods: {
    hideSidebar() {
      let sidebar = document.querySelector('.nk-sidebar')
      sidebar.classList.remove('nk-sidebar-active')

    },
  },
  mounted(){
    NioApp.init();
  },
  mixins: [Helpers]
};
</script>