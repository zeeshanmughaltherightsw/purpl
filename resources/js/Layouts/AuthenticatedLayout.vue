<script setup>
import { ref } from 'vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';
import Sidebar from './Sidebar.vue'
import Header from './Header.vue'
import Footer from './Footer.vue'
const showingNavigationDropdown = ref(false);
</script>

<template>
    <div>
        <div class="nk-main ">
            <Sidebar />
            <div class="nk-wrap ">
                <Header />
                    <slot/>
                <Footer/>
            </div>
        </div>
    </div>
</template>
