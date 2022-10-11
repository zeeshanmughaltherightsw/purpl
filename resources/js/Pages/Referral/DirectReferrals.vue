<template>
    <Head title="Direct referrals" />
    <AuthenticatedLayout>
        <BreadCrumb title="Direct Referrals">
            <template #plugin>
                <li>
                    <div class="form-control-wrap">
                        <div class="form-icon form-icon-right">
                            <em class="icon ni ni-search"></em>
                        </div>
                        <input type="text" class="form-control" id="default-04" placeholder="Search by name">
                    </div>
                </li>
            </template>
        </BreadCrumb>
        <div class="nk-content bg-white">
            <div class="container-fluid">
                <div class="nk-content-inner">
                    <div class="nk-content-body">
                        <div class="components-preview wide-md mx-auto" v-if="referrals.length > 0">
                            <Table>
                                <template #head>
                                    <th class="tb-tnx-info">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Fullname</span>
                                        </span>
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Joined at</span>
                                        </span>
                                    </th>
                                    <th class="tb-tnx-amount is-alt">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Verified</span>
                                        </span>
                                    </th>
                                    <th class="tb-tnx-amount is-alt">
                                        <span class="tb-tnx-desc d-none d-sm-inline-block">
                                            <span>Status</span>
                                        </span>
                                    </th>
                                </template>
                                <template #body>
                                    <tr class="tb-tnx-item" v-for="(referral, index) in referrals" :key="index">
                                        <td class="tb-tnx-info">
                                            <div class="tb-tnx-desc">
                                                <span class="title text-dark text-capitalize">{{ referral.name }}</span>
                                            </div>
                                            <div class="tb-tnx-date">
                                                <span class="date">{{formatDate(referral.created_at)}}</span>
                                            </div>
                                        </td>
                                        <td class="tb-tnx-amount is-alt">
                                            <div class="tb-tnx-status">
                                                <span class="badge badge-dot badge-danger">{{ referral.email_verified_at ? 'Success' : "Not Verified" }}</span>
                                            </div>
                                        </td>
                                        <td class="tb-tnx-amount is-alt">
                                            <div class="tb-tnx-status">
                                                <span class="badge badge-dot badge-success">{{ referral.status ? 'Active' : 'Inactive' }}</span>
                                            </div>
                                        </td>
                                    </tr>
                                </template>
                            </Table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
import { Head } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue'
import Table from '@/Components/SpecialTable.vue'
import Helpers from '@/Mixins/Helpers'
export default {
    props:['referrals'],
    components: { AuthenticatedLayout, Head, BreadCrumb, Table },
    mixins: [Helpers]
}
</script>

<style>

</style>