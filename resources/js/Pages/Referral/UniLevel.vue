<template>

    <Head title="Uni level tree" />
    <AuthenticatedLayout>
        <BreadCrumb title="Uni level tree" />
        <div class="card card-preview">
            <div class="card-inner">
                <div class="nk-tb-list nk-tb-ulist is-compact">
                    <div class="nk-tb-item nk-tb-head">
                        <div class="nk-tb-col"><span class="sub-text">User</span></div>
                        <div class="nk-tb-col tb-col-md"><span class="sub-text">Level</span></div>
                        <div class="nk-tb-col tb-col-sm"><span class="sub-text">Investment</span></div>
                        <div class="nk-tb-col"><span class="sub-text">Status</span></div>
                    </div>
                    <div class="nk-tb-item" v-for="(user, index) in allUsers" :key="index">
                        <div class="nk-tb-col">
                            <div class="user-card">
                                <div class="user-avatar xs bg-primary"><span>{{ user.name.match(/\b(\w)/g).join('') }}</span></div>
                                <div class="user-name"><span class="tb-lead">{{ user.name }}</span></div>
                            </div>
                        </div>
                        <div class="nk-tb-col tb-col-md"><span>{{user.level}}</span></div>
                        <div class="nk-tb-col tb-col-sm"><span>{{user.investment}}</span></div>
                        <div class="nk-tb-col"><span :class="`tb-status text-${getClass(user.status)}`">{{user.status}}</span></div>
                        
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
import Tree from "vue3-tree";
import "vue3-tree/dist/style.css";
import Helpers from '@/Mixins/Helpers';
export default {
    props: ['users'],
    data() {
        return {
            allUsers: [],
            level: 0
        }
    },
    components: { Tree, AuthenticatedLayout, Head, BreadCrumb },
    methods: {
        walkTree(tree, level = 0, collection = []) {

            // Select the values from this level.
            const { nodes, ...obj } = tree;

            // Create an array for this level if it doesn't have one.
            if (!Array.isArray(collection[level])) {
                collection[level] = [];
            }

            // Store the value of this level in the array.
            obj.level = level
            collection[level].push(obj);

            // Loop over sub levels and pass the collection down while incrementing the level.
            for (const subTree of nodes) {
                collection = this.walkTree(subTree, level + 1, collection);
            }

            // Return collection at each level.
            return collection;
        }



    },
    mounted() {
        // Start walking.
        this.allUsers = this.walkTree(this.users).flat(1).slice(1);
    },
    mixins: [Helpers]
}
</script>