<template>
    <Head title="Uni level tree" />
    <AuthenticatedLayout>
    <BreadCrumb title="Uni level tree"/>
        <div class="card card-preview">
            <div class="card-inner">
                <Tree class="text-capitalize fw-bold text-primary"
                    :nodes="user"
                    :use-icon="true"
                    show-child-count
                />
            </div>
        </div>
    </AuthenticatedLayout>
</template>
<script>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
import { Head } from '@inertiajs/inertia-vue3';
import BreadCrumb from '@/Components/BreadCrumb.vue'
import Tree from "vue3-tree";
import "vue3-tree/dist/style.css";
export default {
    props: ['user'],
    components: {Tree, AuthenticatedLayout, Head, BreadCrumb},
    mounted(){
        console.log(this.user.nodes)
    }
}
</script>