<template>

    <Head title="Account Activity" />
    <AuthenticatedLayout>
        <BreadCrumb title="Account Activity" />
        <div class="nk-content ">
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
                                                    <h4 class="nk-block-title">Login Activity</h4>
                                                    <div class="nk-block-des">
                                                        <p>Here is your last 20 login activities log. <span
                                                                class="text-soft"><em
                                                                    class="icon ni ni-info"></em></span></p>
                                                    </div>
                                                </div>
                                                <div class="nk-block-head-content align-self-start d-lg-none">
                                                    <a href="#" class="toggle btn btn-icon btn-trigger mt-n1"
                                                        data-target="userAside"><em
                                                            class="icon ni ni-menu-alt-r"></em></a>
                                                </div>
                                            </div>
                                        </div><!-- .nk-block-head -->
                                        <div class="nk-block card">
                                            <table class="table table-ulogs">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th class="tb-col-os"><span class="overline-title">Browser <span
                                                                    class="d-sm-none">/ IP</span></span></th>
                                                        <th class="tb-col-ip"><span class="overline-title">IP</span>
                                                        </th>
                                                        <th class="tb-col-time"><span class="overline-title">Time</span>
                                                        </th>
                                                        <th class="tb-col-action"><span
                                                                class="overline-title">&nbsp;</span></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(detail, index) in details" :key="index">
                                                        <td class="tb-col-os">{{ detail ? detail.browser: '' }}</td>
                                                        <td class="tb-col-ip"><span class="sub-text">{{ detail ?
                                                        detail.user_ip: '' }}</span></td>
                                                        <td class="tb-col-time"><span class="sub-text">{{
                                                        formatDateTime(detail ? detail.created_at : '') }}</span>
                                                        </td>
                                                        <td class="tb-col-action"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div><!-- .nk-block-head -->
                                    </div><!-- .card-inner -->

                                    <UserSidebar />
                                    <!-- card-aside -->
                                </div><!-- card-aside-wrap -->
                            </div><!-- .card -->
                        </div><!-- .nk-block -->
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
import Helpers from '@/Mixins/Helpers';
export default {
    props: ['details'],
    components: { AuthenticatedLayout, BreadCrumb, Head, Link, UserSidebar },
    mixins: [Helpers],
};

</script>

<style>

</style>