<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link } from '@inertiajs/inertia-vue3';
</script>

<template>
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 shadow" data-content="sidebarMenu">
        <Link :href="route('welcome')" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <img src="logo.png" style="width: 200px; height: 58px;"/>
        </Link>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="">
            <Link :href="route('welcome')" class="nav-item nav-link fw-bold" :class="{ 'active' : route().current('welcome')}">Home</Link>
            <Link :href="route('contact')" class="nav-item nav-link fw-bold" :class="{ 'active' : route().current('contact')}">Contact us</Link>
            <Link :href="route('about')" class="nav-item nav-link fw-bold" :class="{ 'active' : route().current('about')}">About us</Link>
            <Link as="button" v-if="!$page.props.auth.user" text="Sign in" :href="route('login')" type="button" class="btn btn-primary sign mx-3 px-4">Login</Link>
            <Link as="button" v-if="!$page.props.auth.user" :href="route('register', 'Pakistan001')" class="btn btn-primary sign mr-3 px-4">Register</Link>
            <Link as="button" v-if="$page.props.auth.user" :href="route('dashboard')" class="btn btn-primary sign mr-3 px-4">Dashboard</Link>
        </div>
    </nav>

    <slot />

    <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-4 col-md-6">
                    <h4 class="text-white mb-4">Our Office</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>22nd floor capital center 151 Gloucester Road, Wanchai, Hong Kong SAR, China</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+85294106897</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>Liuw94066@gmail.com</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h4 class="text-white mb-4">Services</h4>
                    <a class="btn btn-link" href="">Jade Mining</a>
                    <a class="btn btn-link" href="">Jade Export</a>
                    <a class="btn btn-link" href="">Jewlary Manufecturing</a>
                    <a class="btn btn-link" href="">International Jade Laboratory</a>
                    <a class="btn btn-link" href="">Green Technology</a>
                    <a class="btn btn-link" href="/storage/intro.pdf">International Jade Laboratory</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">Newsletter</h4>
                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="Your email" />
                        <button type="button"
                            class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    methods:{
        forceReload(){
            window.location.reload(true);
        }
    }
}
</script>
