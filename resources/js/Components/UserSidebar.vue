<template>
  <div class="
                      card-aside card-aside-left
                      user-aside
                      toggle-slide toggle-slide-left toggle-break-lg
                    " data-content="userAside" data-toggle-screen="lg" data-toggle-overlay="true">
    <div class="card-inner-group" data-simplebar>
      <div class="card-inner">
        <div class="user-card">
          <div class="user-avatar bg-primary">
            <span>AB</span>
          </div>
          <div class="user-info">
            <span class="lead-text">Abu Bin Ishtiyak</span>
            <span class="sub-text">info@softnio.com</span>
          </div>
          <div class="user-action">
            <div class="dropdown">
              <a class="btn btn-icon btn-trigger mr-n2" data-toggle="dropdown" href="#"><em
                  class="icon ni ni-more-v"></em></a>
              <div class="dropdown-menu dropdown-menu-right">
                <ul class="link-list-opt no-bdr">
                  <li>
                    <a href="#"><em class="icon ni ni-camera-fill"></em><span>Change Photo</span></a>
                  </li>
                  <li>
                    <a href="#"><em class="icon ni ni-edit-fill"></em><span>Update Profile</span></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <!-- .user-card -->
      </div>
      <!-- .card-inner -->
      <div class="card-inner">
        <div class="user-account-info py-0">
          <h6 class="overline-title-alt">Account Balance</h6>
          <div class="user-balance">
            12.395769
            <small class="currency currency-btc">USD</small>
          </div>
          <div class="user-balance-sub">
            Pending
            <span>0.344939
              <span class="currency currency-btc">USD</span></span>
          </div>
        </div>
      </div>
      <!-- .card-inner -->
      <div class="card-inner p-0">
        <ul class="link-list-menu">
          <li class="" :class="{
            'active current-page': route().current('profile'),
          }">
            <Link preserve-scroll :href="route('profile')" class="nk-menu-link">
            <em class="icon ni ni-user-fill-c"></em><span>Personal Infomation</span>
            </Link>
          </li>
          <!-- <li><a href="html/user-profile-notification.html"><em class="icon ni ni-bell-fill"></em><span>Notifications</span></a></li> -->
          <li class="" :class="{
            'active current-page': route().current('account-activity'),
          }">

            <Link preserve-scroll :href="route('account-activity')" class="nk-menu-link">
            <em class="icon ni ni-activity-round-fill"></em><span>Account Activity</span>
            </Link>
          </li>
          <li class="" :class="{'active current-page': route().current('security-setting'),
          }">
            <Link preserve-scroll :href="route('security-setting')" class="nk-menu-link">
            <em class="icon ni ni-lock-alt-fill"></em><span>Security Settings</span>
            </Link>
          </li>
        </ul>
      </div>
      <!-- .card-inner -->
    </div>
    <!-- .card-inner-group -->
  </div>
</template>
<script>
import { Link } from "@inertiajs/inertia-vue3";
export default {
  components: { Link },
};
</script>