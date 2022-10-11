<template>
  <div class="nk-sidebar nk-sidebar-fixed is-light" data-content="sidebarMenu">
    <div class="nk-sidebar-element nk-sidebar-head">
      <div class="nk-sidebar-brand">
        <a href="html/index.html" class="logo-link nk-sidebar-logo">
          <img
            class="logo-light logo-img"
            src="/images/logo.png"
            srcset="/images/logo2x.png 2x"
            alt="logo"
          />
          <img
            class="logo-dark logo-img"
            src="/images/logo-dark.png"
            srcset="/images/logo-dark2x.png 2x"
            alt="logo-dark"
          />
        </a>
      </div>
      <div class="nk-menu-trigger mr-n2">
        <a
          href="#"
          class="nk-nav-toggle nk-quick-nav-icon d-xl-none"
          data-target="sidebarMenu"
          ><em class="icon ni ni-arrow-left"></em
        ></a>
        <a
          href="#"
          class="nk-nav-compact nk-quick-nav-icon d-none d-xl-inline-flex"
          data-target="sidebarMenu"
          ><em class="icon ni ni-menu"></em
        ></a>
      </div>
    </div>
    <!-- .nk-sidebar-element -->
    <div class="nk-sidebar-element">
      <div class="nk-sidebar-content">
        <div class="nk-sidebar-menu" data-simplebar>
          <ul class="nk-menu">
            <li class="nk-menu-item">
              <a href="html/ecommerce/index.html" class="nk-menu-link">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-dashboard"></em
                ></span>
                <span class="nk-menu-text">Dashboard</span>
              </a>
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item">
              <a href="html/lms/index.html" class="nk-menu-link">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-user-c"></em
                ></span>
                <span class="nk-menu-text">Profile</span>
              </a>
            </li>
            <!-- .nk-menu-item -->

            <li class="nk-menu-item has-sub">
              <a href="#" class="nk-menu-link nk-menu-toggle">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-toolbar"></em
                ></span>
                <span class="nk-menu-text">Pins</span>
              </a>
              <ul class="nk-menu-sub">
                <li class="nk-menu-item">
                  <a href="html/project-card.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Pins Info</span></a
                  >
                </li>
              </ul>
              <!-- .nk-menu-sub -->
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item has-sub">
              <a href="#" class="nk-menu-link nk-menu-toggle">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-row-view1"></em
                ></span>
                <span class="nk-menu-text">Purchase</span>
              </a>
              <ul class="nk-menu-sub">
                <li class="nk-menu-item">
                  <a href="html/user-list-default.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Upgrade Membership</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/user-list-regular.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Staking Pack</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/user-list-compact.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Master Node Pack</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/user-details-regular.html" class="nk-menu-link"
                    ><span class="nk-menu-text"
                      >Shared Master Node Packs</span
                    ></a
                  >
                </li>
              </ul>
              <!-- .nk-menu-sub -->
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item has-sub">
              <a href="#" class="nk-menu-link nk-menu-toggle">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-sign-mxn-alt"></em
                ></span>
                <span class="nk-menu-text">Transactions</span>
              </a>
              <ul class="nk-menu-sub">
                <li class="nk-menu-item">
                  <a href="html/orders-default.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Transactions</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/orders-regular.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Invoices</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/orders-sales.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Withdraw</span></a
                  >
                </li>
              </ul>
              <!-- .nk-menu-sub -->
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item has-sub">
              <a href="#" class="nk-menu-link nk-menu-toggle">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-wifi"></em
                ></span>
                <span class="nk-menu-text">Network</span>
              </a>
              <ul class="nk-menu-sub">
                <li class="nk-menu-item">
                  <a href="html/apps-messages.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Direct Referrals</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/apps-inbox.html" class="nk-menu-link"
                    ><span class="nk-menu-text">UniLevel Tree</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/apps-file-manager.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Referral link</span></a
                  >
                </li>
              </ul>
              <!-- .nk-menu-sub -->
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item">
              <a href="html/pricing-table.html" class="nk-menu-link">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-view-col"></em
                ></span>
                <span class="nk-menu-text">Achievement</span>
              </a>
            </li>
            <!-- .nk-menu-item -->
            <li class="nk-menu-item has-sub">
              <a href="#" class="nk-menu-link nk-menu-toggle">
                <span class="nk-menu-icon"
                  ><em class="icon ni ni-setting"></em
                ></span>
                <span class="nk-menu-text">Settings</span>
              </a>
              <ul class="nk-menu-sub">
                <li class="nk-menu-item">
                  <a href="html/invoice-list.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Privacy</span></a
                  >
                </li>
                <li class="nk-menu-item">
                  <a href="html/invoice-details.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Security</span></a
                  >
                </li>

                <li class="nk-menu-item">
                  <a href="html/invoice-details.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Chnage Password</span></a
                  >
                </li>

                <li class="nk-menu-item">
                  <a href="html/invoice-details.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Change Pin</span></a
                  >
                </li>

                <li class="nk-menu-item">
                  <a href="html/invoice-details.html" class="nk-menu-link"
                    ><span class="nk-menu-text">Change Questions</span></a
                  >
                </li>
              </ul>
              <!-- .nk-menu-sub -->
            </li>
            <!-- .nk-menu-item -->
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