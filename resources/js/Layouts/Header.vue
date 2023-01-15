<script setup>
import { ref } from "vue";
import ApplicationLogo from "@/Components/ApplicationLogo.vue";
import Dropdown from "@/Components/Dropdown.vue";
import DropdownLink from "@/Components/DropdownLink.vue";
import NavLink from "@/Components/NavLink.vue";
import ResponsiveNavLink from "@/Components/ResponsiveNavLink.vue";
import { Link } from "@inertiajs/inertia-vue3";
const showingNavigationDropdown = ref(false);
</script>

<template>
  <!-- main header @s -->
  <div class="nk-header nk-header-fixed head">
    <div class="container-fluid">
      <div class="nk-header-wrap">
        <div class="nk-menu-trigger d-xl-none ml-n1" @click="showSidebar">
          <a
            href="#"
            class="nk-nav-toggle nk-quick-nav-icon"
            data-target="sidebarMenu"
            ><em class="icon ni ni-menu"></em
          ></a>
        </div>
        <div class="nk-header-tools">
          <ul class="nk-quick-nav">
            <li class="dropdown language-dropdown d-none d-sm-block mr-n1">
              <a
                href="#"
                class="dropdown-toggle nk-quick-nav-icon"
                data-toggle="dropdown"
              >
              </a>
            </li>
            <li>
              <span data-v-3c8ef2bc="" class="server-time"
                >{{ currentDate }}</span
              >
            </li>
            <li class="dropdown user-dropdown">
              <a href="#" class="dropdown-toggle mr-n1" data-toggle="dropdown">
                <div class="user-toggle">
                  <div class="user-avatar sm">
                    <em class="icon ni ni-user-alt"></em>
                  </div>
                  <div class="user-info d-none d-xl-block">
                    <div class="user-name dropdown-indicator"></div>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
                <div
                  class="
                    dropdown-inner
                    user-card-wrap
                    bg-lighter
                    d-none d-md-block
                  "
                >
                  <div class="user-card">
                    <div class="user-avatar">
                      <span>{{ $page.props.auth.user.name.match(/\b(\w)/g).join('') }}</span>
                    </div>
                    <div class="user-info">
                      <span class="lead-text">{{ $page.props.auth.user.name }}</span>
                      <span class="sub-text"> {{ $page.props.auth.user.email }} </span>
                    </div>
                  </div>
                </div>
                <div class="dropdown-inner">
                  <ul class="link-list">
                    <li>
                      <Link :href="route('profile')"
                        ><em class="icon ni ni-user-alt"></em
                        ><span>View Profile</span></Link
                      >
                    </li>
                    <li>
                      <Link :href="route('security-setting')"
                        ><em class="icon ni ni-setting-alt"></em
                        ><span>Account Setting</span></Link
                      >
                    </li>
                    <li>
                      <Link :href="route('account-activity')"
                        ><em class="icon ni ni-activity-alt"></em
                        ><span>Login Activity</span></Link
                      >
                    </li>
                    <li><a class="dark-switch" :href="void(0)"><em class="icon ni ni-moon"></em><span>Dark Mode</span></a></li>
                  </ul>
                </div>
                <div class="dropdown-inner">
                  <ul class="link-list">
                    <li>
                      <Link
                        class="btn btn-danger"
                        :href="route('logout')"
                        method="post"
                        as="button"
                      >
                        Log Out
                      </Link>
                    </li>
                  </ul>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <!-- .nk-header-wrap -->
    </div>
    <!-- .container-fliud -->
  </div>
  <!-- main header @e -->
</template>
<script>
import moment from 'moment'
import { useForm } from '@inertiajs/inertia-vue3'

export default {
  methods: {
    showSidebar(){
      let sidebar = document.querySelector('.nk-sidebar')
      document.querySelector('.nk-sidebar-widget').classList.remove('d-none')
      document.querySelector('.nk-sidebar-widget').classList.add('d-xl-block')
      sidebar.classList.add('nk-sidebar-active')
    },
  },
  computed:{
    currentDate(){
      return  moment().format("Do MMM YYYY hh:mm:ss");
    }
  },
  async mounted(){
    NioApp.ModeSwitch();
    let form = useForm({
      'groups' : ['currency_setting']
    });
    await axios.get('settings', {
      params: {
        groups: ['currency_setting', 'referrals']
      }
    }).then((res) => {
      localStorage.cur_sym = res.data.find(obj => obj.key == 'cur_sym').value
      localStorage.cur_text = res.data.find(obj => obj.key == 'cur_text').value
      localStorage.referral = res.data.find(obj => obj.key == 'referrals').value
    });
  }
}
</script>