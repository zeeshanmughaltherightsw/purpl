<template>
  <Head title="Referral Link"/>
  <AuthenticatedLayout>
    <BreadCrumb title="Referral link"/>
    <div class="card card-preview">
        <div class="card-inner">
            <ul class="nav nav-tabs mt-n3">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#referral-link">Referral link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#help">Help</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="referral-link">
                    <p>(Your referral link is below click copy and give to the persons who wish to make you their reference)</p>
                    <p>{{ route('register', $page.props.auth.user.account_no) }}</p>    
                </div>
                <div class="tab-pane" id="help">
                    <p>Referral Banner is your referral link that you can copy and send to your friends or other people to join the Pr PAL with your sponsorship. By achieving your target you can get monthly bonuses. If you manage your extra referrals as your indirect referrals, still you can get profit and benefit from your indirect referrals.</p>    
                </div>
            </div>
        </div>
    </div>
  </AuthenticatedLayout>
</template>

<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import BreadCrumb from '@/Components/BreadCrumb.vue';
import { Head } from '@inertiajs/inertia-vue3';
export default {
    components: { AuthenticatedLayout, BreadCrumb, Head }
}
</script>

<style>

</style>