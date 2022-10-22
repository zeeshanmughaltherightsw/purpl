<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import GuestLayout from '@/Layouts/GuestLayout.vue'
</script>

<template>

    <Head title="Home" />

    <GuestLayout>
        <img class="w-100" src="img/homebg.jpg" alt="Image">
        <div class="carousel-caption row">
            <div class="justify-content-left row-cols-3 container">
                <h3 class="display-2 text-white mb-5 animated slideInDown">Stonearn
                </h3>
                <p>
                    We provide an efficient platform for the crypto lovers for trading and making investments in
                    cryptocurrency. Join us to enjoy professional assistance for your growing.
                </p>
            </div>
        </div>
        <!-- Carousel End -->
        <!-- Top Feature Start -->
        <div class="container-fluid py-5 pt-lg-0 lazyload" id="quick_services" >
            <div class="container py-5 pt-lg-0" v-if="lazyLoadElement.quick_services">
                <div class="row gx-0">
                    <QuickService title="Quick Services" icon="fas fa-times"/>
                    <QuickService title="Dedicated Team" icon="fas fa-users text-primary"/>
                    <QuickService title="24/7 Available" icon="fas fa-phone text-primary"/>
                </div>
            </div>
        </div>
        <!-- Top Feature End -->

        <!-- Plans-Starts -->
        <center>
            <div class="lazyload" id="plans">
                <h1 class="display-4 col-12">Our Membership Plans</h1>
                <!-- investors cards -->
                <h1 class="py-5 col-12">FOR INVESTORS</h1>
                <div class="row container"  v-if="lazyLoadElement.plans">
                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">
                            <h3 class="plan">BASIC</h3>
                            <h5 class="plan">50$</h5>
                            <div class="solu_description">
                                <ul class="my-2">
                                    <li class="">
                                        <b>Estimated Profit</b>
                                    </li>
                                    <li>
                                        4% to 8%
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <Button type="button" class="read_more_btn my-3">Upgrade Now</Button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan">STARTER</h3>
                            <h5 class="plan">100$</h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li class="">
                                        <b>Estimated Profit</b>
                                    </li>
                                    <li>
                                        4% to 8%
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>
                                </ul>
                                <button type="button" class="read_more_btn my-3">Upgrade Now</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan">SILVER</h3>
                            <h5 class="plan">500$</h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li class="">
                                        <b>Estimated Profit</b>
                                    </li>
                                    <li>
                                        4% to 8%
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>
                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>
                    <!-- investors cards end -->
                    <!-- refferals cards -->
                    <h1 class="col-12 my-3 py-5">FOR REFFERALS</h1>
                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">
                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>
                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        1 to 10
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        1 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        11 to 20
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        2 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>
                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 solution_cards_box">
                        <div class="solution_card">


                            <h1 class="plan"></h1>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        21 to 30
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        3 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>



                    <!-- refferals cards end -->


                    <!-- highly agents cards -->


                    <h1 class="col-12 py-5 my-3">FOR HIGHLY AGENTS</h1>


                    <div class="col-md-3 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        1 to 50 <br> <b>With</b> <br>2500$
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        4 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        50 to 100 <br> <b>With</b> <br>10,000$
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        5 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        100 to 400 <br> <b>With</b> <br>2,00,000$
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        6 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 solution_cards_box">
                        <div class="solution_card">


                            <h3 class="plan"></h3>
                            <h5 class="plan"></h5>

                            <div class="solu_description">
                                <ul class="my-2">
                                    <li>
                                        <b>Refferals</b>
                                    </li>
                                    <li>
                                        More then 400 <br> <b>With</b> <br>20,00,000$
                                    </li>
                                    <li>
                                        <b>Refferal Commission</b>
                                    </li>
                                    <li>
                                        7 Percent
                                    </li>
                                    <li>
                                        <b>Amount Return</b>
                                    </li>
                                    <li>
                                        14 Months
                                    </li>


                                </ul>
                                <button type="button" class="read_more_btn my-3">Uprade Now</button>
                            </div>
                        </div>
                    </div>



                    <!-- highly agents cards end -->


                </div>
            </div>
        </center>
        <!-- plan End -->
        <!-- About Start -->
        <div class="container-xxl py-5 lazyload" id="about" >
            <div class="container" v-if="lazyLoadElement.about">
                <div class="row g-5 align-items-end">
                    <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                        <img class="img-fluid rounded" data-wow-delay="0.1s" src="img/about.jpg">
                    </div>
                    <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s">
                        <h1 class="display-1 mb-0">25</h1>
                        <p class="text-primary mb-4">Year of Experience</p>
                        <h1 class="display-5 mb-4">ABOUT US</h1>
                        <p class="mb-4">Indeed, Jewellery is something that Women love. But when it comes to Gems or
                            Stones Jewellery, Men are also included in the list of Jewellery lovers. No doubt, it’s
                            difficult to design Stone Jewellery.
                            Therefore, “stonearn” came up with brilliant jewelry of stone designs of rings, necklaces,
                            bracelets, earrings, studs, and much more. Besides, stone jewelry designs are an attraction
                            for people over the years and are still expanding. <br>
                            Stonearn also buys mines and does stone mining by taking the help of stone and mine experts.
                            We mine different precious and unique stones that are rare.
                            Plus, making jewelry takes hours and hours of work on the bench utilizing all types of hand
                            tools. In our opinion, jewelry mirrors the personality and represents the style and class of
                            its owner. Furthermore, along with the fact that a piece of jewelry can accompany somebody a
                            thousand times and years, this just but its value remains expensive. <br>
                            Stonearn brand allows you the facility of custom designs and helps you to fix all gem
                            jewelry-related problems. Plus, it gives you modern, classic, and unique designs of jewelry
                            that are made of stones. Stone jewelry creates a shining charm to your personality.


                        </p>
                        <a class="btn btn-primary py-3 px-4" href="">Explore More</a>
                    </div>
                    <div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="row g-5">
                            <div class="col-12 col-sm-6 col-lg-12">
                                <div class="border-start ps-4">
                                    <i class="fas fa-award fa-3x text-primary mb-3"></i>
                                    <h4 class="mb-3">Award Winning</h4>
                                    <span>Indeed, Stonearn is an award-winning company that works related to stone
                                        mining and stone jewelry</span>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-12">
                                <div class="border-start ps-4">
                                    <i class="fas fa-users fa-3x text-primary mb-3"></i>
                                    <h4 class="mb-3">Dedicated Team</h4>
                                    <span>For Stone mining and jewelry designs, we have a dedicated team of experts who
                                        do their work always expertly</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

        <!-- Features Start -->
        <div class="container-xxl py-5 lazyload" id="chose" >
            <div class="container" v-if="lazyLoadElement.chose">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">Why Choosing Us!</p>
                        <h1 class="display-5 mb-4">Few Reasons Why People Choosing Us!</h1>
                        <p class="mb-4">We provide excellent stones and Gems Collection with modern, unique, and
                            eye-catching jewelry designs that develop people's interests. Besides, our jewelry is
                            handmade with high-quality materials and a sharp finish the way people like
                        </p>
                        <a class="btn btn-primary py-3 px-4" href="">Explore More</a>
                    </div>
                    <div class="col-lg-6">
                        <div class="row g-4 align-items-center">
                            <div class="col-md-6">
                                <div class="row g-4">
                                    <div class="col-12 wow fadeIn" data-wow-delay="0.3s">
                                        <div class="text-center rounded py-5 px-4"
                                            style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                                style="width: 90px; height: 90px;">

                                                <i class="fas fa-check fa-3x text-primary"></i>
                                            </div>
                                            <h4 class="mb-0">100% Satisfaction</h4>
                                        </div>
                                    </div>
                                    <div class="col-12 wow fadeIn" data-wow-delay="0.5s">
                                        <div class="text-center rounded py-5 px-4"
                                            style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                                style="width: 90px; height: 90px;">
                                                <i class="fas fa-users fa-3x text-primary"></i>
                                            </div>
                                            <h4 class="mb-0">Dedicated Team</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 wow fadeIn" data-wow-delay="0.7s">
                                <div class="text-center rounded py-5 px-4"
                                    style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                    <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                        style="width: 90px; height: 90px;">
                                        <i class="fas fa-tools fa-3x text-primary"></i>
                                    </div>
                                    <h4 class="mb-0">Modern Equipment</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features End -->
        <!-- Service Start -->
        <div class="container-xxl py-5 lazyload" id="services" >
            <div class="container" v-if="lazyLoadElement.services">
                <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                    <p class="fs-5 fw-bold text-primary">Our Services</p>
                    <h1 class="display-5 mb-5">Services That We Offer For You</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-4.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5">All Stone Jewelry</h4>
                                <p class="m-5">We provide you with all kinds of stone jewelry in unique and modern
                                    designs with antique Gems. </p>
                                <!-- <button type="button" class="btn btn-primary">Primary</button> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-5.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5">Custom Designs</h4>
                                <p class="m-5">We encourage our clients to order jewelry with custom designs or changes
                                    that they want. </p>
                                <!-- <a class="btn btn-sm" href=""><i class="fas fa-plus text-primary me-2"></i>Read More</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-6.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5">Fix Raw Designs</h4>
                                <p class="m-5">Stonearn fixes the problem of each stone jewelry and gives finishing to
                                    your raw designs.</p>
                                <!-- <a class="btn btn-sm" href=""><i class="fas fa-plus text-primary me-2"></i>Read More</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-7.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5">Stone Mine Experts</h4>
                                <p class="mb-5">For stone mining, we get the help of experts who have a good knowledge
                                    of stones and their mining.
                                </p>
                                <!-- <a class="btn btn-sm" href=""><i class="fas fa-plus text-primary me-2"></i>Read More</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-8.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5">Stone Mining</h4>
                                <p class="mb-5">We also provide the service of different kinds of stone mining and
                                    polish them to utilize in jewelry.
                                </p>
                                <!-- <a class="btn btn-sm" href=""><i class="fas fa-plus text-primary me-2"></i>Read More</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item rounded d-flex h-100">
                            <div class="service-img rounded">
                                <img class="img-fluid" src="img/services/services-9.jpg" alt="">
                            </div>
                            <div class="service-text rounded p-5">

                                <h4 class="m-5"> Buy Stone Mine</h4>
                                <p class="mb-5">Stonearn not just made jewelry from stone mines but also mines in which
                                    stones were discovered and then sold them. </p>
                                <!-- <a class="btn btn-sm" href=""><i class="fas fa-plus text-primary me-2"></i>Read More</a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial Start -->
        <div class="container-xxl py-5 lazyload" id="testimonial">
            <div class="container" v-if="lazyLoadElement.testimonial">
                <div class="row g-5">
                    <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">Testimonial</p>
                        <h1 class="display-5 mb-5">What Our Clients Say About Us!</h1>
                        <p class="mb-4">Our first priority is to satisfy our clients. That is why they say that “Our
                            professionalism and commitment to the work always inspires them”. So, they contact us with
                            related stone mining and stone jewelry designs.</p>
                        <a class="btn btn-primary py-3 px-4" href="">See More</a>
                    </div>
                    <div class="col-lg-7 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="owl-carousel testimonial-carousel">
                            <div class="testimonial-item">
                                <img class="img-fluid rounded mb-3" src="img/testimonial-1.jpg" alt="">
                                <p class="fs-5">I am Clara White and I Love stone jewelry. Stonearn is the brand that
                                    completes my dream of wearing unique and rare stone jewelry in amazing designs.
                                </p>
                                <h4>Clara White</h4>

                            </div>
                            <div class="testimonial-item">
                                <img class="img-fluid rounded mb-3" src="img/testimonial-2.jpg" alt="">
                                <p class="fs-5">I am Richard Andreson. I love to know about stone mining and different
                                    kinds of precious stones that can only be possible because of Stonearn.
                                </p>
                                <h4>Richard Andreson</h4>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
    </GuestLayout>
</template>

<script>
import QuickService from '@/Components/QuickService.vue'
import Button from '@/Components/PrimaryButton.vue'
export default {
    data() {
        return {
            lazyLoadElement: {
                quick_services: false,
                plans: false,
                about: false,
                chose: false,
                services: false,
                testimonial: false
            }
        }
    },
    components: {QuickService, Button},
    methods: {
        onObserve() {
            const sections = document.querySelectorAll('div.lazyload')
            const options = {
                threshold: 0.5
            }
            const showComponent = (comp) => {
                this.lazyLoadElement[comp] = true
            };
            const observer = new IntersectionObserver(function (entries, observer) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        showComponent(entry.target.id)
                    }
                })
            }, options)
            sections.forEach(section => {
                observer.observe(section)
            })
        },
    },
    mounted(){
        this.onObserve()
    }
}
</script>
