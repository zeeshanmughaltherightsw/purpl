<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue';
import Struggling from '@/Components/Struggling.vue';
import Alert from '../Components/Alert.vue';
import DashboardCard from '../Components/DashboardCard.vue';
</script>

<template>

    <Head title="Dashboard" />
    <AuthenticatedLayout>
        <div class="nk-block">
            <div class="row g-gs">
                <div class="col-xxl-12 col-sm-12">
                   <Struggling :users="users"/>
                </div><!-- .col -->
                <div class="col-xxl-12 col-sm-12">
                    <div class="nk-block-head nk-block-head-sm">
                        <div class="nk-block-between">
                            <div class="nk-block-head-content">
                                <div class="toggle-wrap nk-block-tools-toggle">
                                    <a href="#" class="btn btn-icon btn-trigger toggle-expand mr-n1"
                                        data-target="pageMenu"><em class="icon ni ni-more-v"></em></a>
                                    <div class="toggle-expand-content" data-content="pageMenu">
                                        <ul class="nk-block-tools g-3">
                                            <li class="nk-block-tools-opt">
                                                <Link :href="route('profile')" class="btn btn-primary bg-azure">
                                                    <em class="icon ni ni-reports"></em><span>Edit profile</span>
                                                </Link>
                                            </li>
                                            <li class="nk-block-tools-opt">
                                                <Link :href="route('membership.index')" class="btn btn-primary bg-azure">
                                                    <em class="icon ni ni-reports"></em><span>Deposit now</span>
                                                </Link>
                                            </li>
                                            <li class="nk-block-tools-opt" v-if="users.plan_id">
                                                <Link :href="route('referral-link')" class="btn btn-primary bg-azure">
                                                    <em class="icon ni ni-reports"></em><span>Referral link</span>
                                                </Link>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div><!-- .nk-block-head-content -->
                        </div><!-- .nk-block-between -->
                    </div><!-- .nk-block-head -->
                    <!-- XLT PRICE -->
                    <Alert/>
                </div>
                <div class="col-xxl-4 col-xl-4 col-md-4 col-sm-12" >
                    <DashboardCard title="Investment" :content="formatCurrency(users.investment)"/>
                </div>
                <div class="col-xxl-4 col-xl-4 col-md-4 col-sm-12" >
                    <DashboardCard title="Profit" :content="formatCurrency(users.profit)"/>
                </div>
                <div class="col-xxl-4 col-xl-4 col-md-4 col-sm-12" >
                    <DashboardCard title="Commission" :content="formatCurrency(users.commission)"/>
                </div>
                <div class="col-xxl-4 col-xl-4 col-md-4 col-sm-12" v-if="users.plan_id">
                    <DashboardCard title="Plan" :content="users.plan.name"/>
                </div>
                <div class="col-xxl-4 col-xl-4 col-md-4 col-sm-12" v-if="users.reward && users.reward_title">
                    <DashboardCard :title="users.reward_title" :content="formatCurrency(users.reward)"/>
                </div>
                
            </div><!-- .row -->
        </div><!-- .nk-block -->
    </AuthenticatedLayout>
</template>
<script>
import { Link } from '@inertiajs/inertia-vue3';
import Helpers from '@/Mixins/Helpers';
export default {
    props: ['users'],
    components: {Link},
    mixins: [Helpers]
}
</script>