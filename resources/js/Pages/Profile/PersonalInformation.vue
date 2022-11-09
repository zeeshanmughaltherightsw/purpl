<template>

  <Head title="Personal Information" />
  <AuthenticatedLayout>
    <BreadCrumb title="Personal Information" />
    <div class="nk-content">
      <div class="container-fluid">
        <div class="nk-content-inner">
          <div class="nk-content-body">
            <div class="nk-block">
              <div class="card">
                <div class="card-aside-wrap">
                  <div class="card-inner card-inner-lg">
                    <div class="nk-block-head nk-block-head-lg">
                      <div class="nk-block-between">
                        <div class="nk-block-head-content">
                          <h4 class="nk-block-title">Personal Information</h4>
                          <div class="nk-block-des">
                            <p>
                              Basic info
                            </p>
                          </div>
                        </div>
                        <div class="
                            nk-block-head-content
                            align-self-start
                            d-lg-none
                          ">
                          <a href="#" class="toggle btn btn-icon btn-trigger mt-n1" data-target="userAside"><em
                              class="icon ni ni-menu-alt-r"></em></a>
                        </div>
                      </div>
                    </div>
                    <!-- .nk-block-head -->
                    <div class="nk-block">
                      <div class="nk-data data-list">
                        <div class="data-head">
                          <h6 class="overline-title">Basics</h6>
                        </div>
                        <div class="data-item" data-toggle="modal" data-target="#profile-edit">
                          <div class="data-col">
                            <span class="data-label">Full Name</span>
                            <span class="data-value">{{ profiles ? profiles.name: '' }}</span>
                          </div>
                          <div class="data-col data-col-end">
                            <span class="data-more"><em class="icon ni ni-forward-ios"></em></span>
                          </div>
                        </div>
                        <!-- data-item -->
                        <div class="data-item" data-toggle="modal" data-target="#profile-edit">
                          <div class="data-col">
                            <span class="data-label">Display Name</span>
                            <span class="data-value">{{ profiles ? profiles.username: '' }}</span>
                          </div>
                          <div class="data-col data-col-end">
                            <span class="data-more"><em class="icon ni ni-forward-ios"></em></span>
                          </div>
                        </div>
                        <!-- data-item -->
                        <div class="data-item">
                          <div class="data-col">
                            <span class="data-label">Email</span>
                            <span class="data-value">{{ profiles ? profiles.email: '' }}</span>
                          </div>
                          <div class="data-col data-col-end">
                            <span class="data-more disable"><em class="icon ni ni-lock-alt"></em></span>
                          </div>
                        </div>
                        <!-- data-item -->
                        <div class="data-item" data-toggle="modal" data-target="#profile-edit">
                          <div class="data-col">
                            <span class="data-label">Phone Number</span>
                            <span class="data-value text-soft">{{ profiles ? profiles.phone_no: '' }}</span>
                          </div>
                          <div class="data-col data-col-end">
                            <span class="data-more"><em class="icon ni ni-forward-ios"></em></span>
                          </div>
                        </div>
                        <!-- data-item -->
                        <div class="data-item" data-toggle="modal" data-target="#profile-edit"
                          data-tab-target="#address">
                          <div class="data-col">
                            <span class="data-label">Address</span>
                            <span class="data-value">{{ profiles ? profiles.address: '' }}</span>
                          </div>
                          <div class="data-col data-col-end">
                            <span class="data-more"><em class="icon ni ni-forward-ios"></em></span>
                          </div>
                        </div>
                        <!-- data-item -->
                      </div>
                      <!-- data-list -->
                      
                      <!-- data-list -->
                    </div>
                    <!-- .nk-block -->
                  </div>
                  <UserSidebar />
                  <!-- card-aside -->
                </div>
                <!-- .card-aside-wrap -->
              </div>
              <!-- .card -->
            </div>
            <!-- .nk-block -->
          </div>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>

<script>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import BreadCrumb from "@/Components/BreadCrumb.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
import UserSidebar from "@/Components/UserSidebar.vue";
export default {
  props: ['profiles'],
  components: { AuthenticatedLayout, BreadCrumb, Head, Link, UserSidebar },
};

</script>

<style>

</style>