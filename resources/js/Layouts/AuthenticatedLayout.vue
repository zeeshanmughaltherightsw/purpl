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
                <div class="nk-content ">
                    <div   div class="container-fluid">
                        <div class="nk-content-inner">
                            <div class="nk-content-body">
                                <slot/>
                            </div>
                        </div>
                    </div>
                </div>
                <Footer/>
            </div>
        </div>
    </div>
</template>
<script>
export default{
    mounted(){
        // window.NioApp.BS.init()
        // window.NioApp.TGL.init()
    }
}
</script>
