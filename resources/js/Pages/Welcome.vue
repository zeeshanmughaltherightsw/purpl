<script setup>
import { Head, Link } from "@inertiajs/inertia-vue3";
import GuestLayout from "@/Layouts/GuestLayout.vue";
</script>

<template>

    <Head title="Home" />
    <GuestLayout>
        <img class="w-100" src="img/homebg.jpg" alt="Image" />
        <div class="carousel-caption row">
            <div class="justify-content-left row-cols-3 container">
                <h3 class="display-2 text-white mb-5 mt-5 animated slideInDown">Stonearn</h3>
                <p>
                    We provide an efficient platform for the crypto lovers for trading and
                    making investments in cryptocurrency. Join us to enjoy professional
                    assistance for your growing.
                </p>

                <a     href="/storage/intro.pdf" class="btn btn-primary sign mr-3 px-4 float-left mobile-view">Know more</a>

            </div>
        </div>
        <!-- Carousel End -->
        <!-- Top Feature Start -->
        <div class="container-fluid top-feature py-5 pt-lg-0" id="quick_services">
            <div class="container py-5 pt-lg-0">
                <div class="row gx-0 mx-5">
                    <QuickService title="Quick Services" icon="fas fa-star text-primary" />
                    <QuickService title="Dedicated Team" icon="fas fa-users text-primary" />
                    <QuickService title="24/7 Available" icon="fas fa-phone text-primary" />
                </div>
            </div>
        </div>

        <!-- Top Feature End -->
        <!-- Plans-Starts -->
        <center>
            <h1 class="display-5 py-3">Our Membership Plans</h1>

            <Link class="btn btn-primary py-3 px-4" :href="route('plan-details')">Click Here For More Details</Link>


            <!-- investors cards -->
            <h1 class="py-5" v-if="investorPlans.length > 0">FOR INVESTORS</h1>
            <div class="row container justify-content-between">
                <div v-for="plan in investorPlans" :key="plan.id"
                    class="solution_cards_box col-md-4" >
                    <PlanCard v-if="plan.plan_type == 'investor'"
                      :title="plan.name"
                      :amountReturn="plan.amount_returns"
                      :profit="plan.profit"
                      :min_price="plan.min_price"
                      :max_price="plan.max_price"
                      :expire="plan.expire"

                      planType="investor" />
                </div>


                <!-- refferals cards -->

                <h1 class="col-12 my-3 py-5" v-if="referralPlans.length > 0">FOR REFFERALS</h1>

                <div class="solution_cards_box col-md-2">
                </div>
                <div class="solution_cards_box col-md-4" v-if="referralPlans.length > 0">
                    <PlanCard
                        :title="referralPlans[0].name"
                        price=""
                        :minReffer="referralPlans[0].min_ref"
                        :maxReffer="referralPlans[0].max_ref"
                        :expire="referralPlans[0].expire"
                        :commission="referralPlans[0].ref_commission"
                        :levels="referralPlans[0].levels_count"
                        planType="referral" />
                </div>
                <div class="solution_cards_box col-md-4" v-if="referralPlans.length > 1">
                    <PlanCard
                        :title="referralPlans[1].name"
                        price=""
                        :minReffer="referralPlans[1].min_ref"
                        :maxReffer="referralPlans[1].max_ref"
                        :expire="referralPlans[1].expire"
                        :commission="referralPlans[1].ref_commission"
                        :levels="referralPlans[1].levels_count"
                        planType="referral" />
                </div>
                <div class="solution_cards_box col-md-2">
                </div>
                <!-- refferals cards end -->

                <!-- highly agents cards -->

                <h1 class="col-12 py-5 my-3" v-if="highAgentPlans.length > 0">FOR HIGHLY AGENTS</h1>

                <div v-for="plan in highAgentPlans" :key="plan.id" class="solution_cards_box" :class="`${'col-md-' + 12/referralPlans.length}`">
                    <PlanCard v-if="plan.plan_type == 'high_agent'" title=""
                      :min_price="plan.min_price"
                      :max_price="plan.max_price"
                      :expire="plan.expire"

                    :minReffer="plan.min_ref" :maxReffer="plan.max_ref" :amountReturn="plan.amount_returns"
                    :commission="plan.ref_commission + ' Percent'" planType="high_agent" />
                </div>


                <!-- highly agents cards end -->
            </div>
        </center>

        <!-- plan End -->
        <div class="main text-center mt-5">
            <h1 class="reward-heading display-5 py-3">REWARDS</h1>
            <Link class="btn btn-primary py-3 px-4" :href="route('reward-details')">Click Here For More Details</Link>
        </div>
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-end">
                    <div class="col-md-3 border-right" v-for="(reward, index) in rewards" :key="index">
                        <reward-card
                            :name="reward.name"
                            :investment="reward.total_investment"
                            :amount="reward.amount"
                            :index="index+1"
                        />
                    </div>
                </div>
            </div>
        </div>


        <!-- refferals levels starts -->

        <div style="margin: 20px 50px">
            <h1 style="margin: 20px 50px" class="text-center display-5 py-3">
              Refferals Commission
            </h1>
            <div class="text-center">
                <Link class="btn btn-primary py-2 px-4 my-2" :href="route('refferal-commission-detail')">For Details Click Here</Link>
            </div>
            <h6 class="my-3">Level 1 (Only one time)</h6>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                style="max-width: 100%">
                <span class="title">5% of investment</span>
              </div>
            </div>
          </div>
          <div style="margin: 20px 50px">
            <h6 class="my-3">Level 2 (Monthly)</h6>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                style="max-width: 60%">
                <span class="title">2% of investment</span>
              </div>
            </div>
          </div>

          <div style="margin: 20px 50px">
            <h6 class="my-3">Level 3 to 5 (Monthly)</h6>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                style="max-width: 30%">
                <span class="title">1% of investment</span>
              </div>
            </div>
          </div>



          <div style="margin: 20px 50px">
            <h6 class="my-3">Level 6 to 8 (Monthly)</h6>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                style="max-width: 20%">
                <span class="title">0.5% of investment</span>
              </div>
            </div>
          </div>

          <div style="margin: 20px 50px">
            <h6 class="my-3">Level 9 to 15 (Monthly)</h6>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                style="max-width: 15%">
                <span class="title">0.25% of investment</span>
              </div>
            </div>
          </div>

        <!-- refferals levels end -->





        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-end">
                    <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                        <img class="img-fluid rounded" data-wow-delay="0.1s" src="img/about.jpg" />
                    </div>
                    <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s">
                        <h1 class="display-1 mb-0">25</h1>
                        <p class="text-primary mb-4">Year of Experience</p>
                        <h1 class="display-5 mb-4">ABOUT US</h1>
                        <p class="mb-4">
                            Indeed, Jewellery is something that Women love. But when it comes
                            to Gems or Stones Jewellery, Men are also included in the list of
                            Jewellery lovers. No doubt, it’s difficult to design Stone
                            Jewellery. Therefore, “stonearn” came up with brilliant jewelry of
                            stone designs of rings, necklaces, bracelets, earrings, studs, and
                            much more. Besides, stone jewelry designs are an attraction for
                            people over the years and are still expanding. <br />
                            Stonearn also buys mines and does stone mining by taking the help
                            of stone and mine experts. We mine different precious and unique
                            stones that are rare. Plus, making jewelry takes hours and hours
                            of work on the bench utilizing all types of hand tools. In our
                            opinion, jewelry mirrors the personality and represents the style
                            and class of its owner. Furthermore, along with the fact that a
                            piece of jewelry can accompany somebody a thousand times and
                            years, this just but its value remains expensive. <br />
                            Undoubtedly, by investing in mining, you will effortlessly make a
                            good amount of profit without any difficulty. So, on Stonearn, you
                            not only just get the stone jewelry designs but also get profit by
                            investing in mining. For this purpose, we came up with different
                            investment plans for investors that you can check on our Stonearn
                            website.
                        </p>
                        <a class="btn btn-primary py-3 px-4" href="">Explore More</a>
                    </div>
                    <div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="row g-5">
                            <div class="col-12 col-sm-6 col-lg-12">
                                <div class="border-start ps-4">
                                    <i class="fas fa-award fa-3x text-primary mb-3"></i>
                                    <h4 class="mb-3">Award Winning</h4>
                                    <span>Indeed, Stonearn is an award-winning company that works
                                        related to stone mining and stone jewelry</span>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-lg-12">
                                <div class="border-start ps-4">
                                    <i class="fas fa-users fa-3x text-primary mb-3"></i>
                                    <h4 class="mb-3">Dedicated Team</h4>
                                    <span>For Stone mining and jewelry designs, we have a dedicated
                                        team of experts who do their work always expertly</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

        <!-- Features Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">Why Choosing Us!</p>
                        <h1 class="display-5 mb-4">Few Reasons Why People Choosing Us!</h1>
                        <p class="mb-4">
                            We provide excellent stones and Gems Collection with modern,
                            unique, and eye-catching jewelry designs that develop people's
                            interests. Besides, our jewelry is handmade with high-quality
                            materials and a sharp finish the way people like
                        </p>
                        <a class="btn btn-primary py-3 px-4" href="">Explore More</a>
                    </div>
                    <div class="col-lg-6">
                        <div class="row g-4 align-items-center">
                            <div class="col-md-6">
                                <div class="row g-4">
                                    <div class="col-12 wow fadeIn" data-wow-delay="0.3s">
                                        <div class="text-center rounded py-5 px-4"
                                            style="box-shadow: 0 0 45px rgba(0, 0, 0, 0.08)">
                                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                                style="width: 90px; height: 90px">
                                                <i class="fas fa-check fa-3x text-primary"></i>
                                            </div>
                                            <h4 class="mb-0">100% Satisfaction</h4>
                                        </div>
                                    </div>
                                    <div class="col-12 wow fadeIn" data-wow-delay="0.5s">
                                        <div class="text-center rounded py-5 px-4"
                                            style="box-shadow: 0 0 45px rgba(0, 0, 0, 0.08)">
                                            <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                                style="width: 90px; height: 90px">
                                                <i class="fas fa-users fa-3x text-primary"></i>
                                            </div>
                                            <h4 class="mb-0">Dedicated Team</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 wow fadeIn" data-wow-delay="0.7s">
                                <div class="text-center rounded py-5 px-4"
                                    style="box-shadow: 0 0 45px rgba(0, 0, 0, 0.08)">
                                    <div class="btn-square bg-light rounded-circle mx-auto mb-4"
                                        style="width: 90px; height: 90px">
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
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px">
                    <p class="fs-5 fw-bold text-primary">Our Services</p>
                    <h1 class="display-5 mb-5">Services That We Offer For You</h1>
                </div>
                <div class="row g-4">
                    <our-services
                      v-for="card in servicesCard" :key="card"
                      :title="card.title"
                      :image="card.image"
                      :description="card.description"
                    />
                </div>
            </div>
        </div>
        <!-- Service End -->

        <!-- Testimonial Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                   <our-clients testimonial="Testimonial" title="What our Clients Say About Us" desec="Our first priority is to satisfy our clients. That is why they say
                            that “Our professionalism and commitment to the work always
                            inspires them”. So, they contact us with related stone mining and
                            stone jewelry designs."/>
                  </div>
            </div>
        </div>
        <!-- Testimonial End -->
    </GuestLayout>
</template>

<script>
import QuickService from "@/Components/QuickService.vue";
import Button from "@/Components/PrimaryButton.vue";
import PlanCard from "@/Components/PlanCard.vue";
import OurServices from '@/Components/OurServices.vue';
import OurClients from '@/Components/OurClients.vue';
import RewardCard from '@/Components/RewardCard.vue'
export default {
    props: ['plans', 'rewards'],
    data() {
        return {
            investorPlans: this.plans.filter((obj) => {
                return obj.plan_type == 'investor'
            }),
            referralPlans: this.plans.filter((obj) => {
                return obj.plan_type == 'referral'
            }),
            highAgentPlans: this.plans.filter((obj) => {
                return obj.plan_type == 'high_agent'
            }),
            lazyLoadElement: {
                quick_services: false,
                plans: false,
                about: false,
                chose: false,
                services: false,
                testimonial: false,
            },
            servicesCard: [
                  {
                    title: 'Stone Mine Experts',
                    image: 'img/services/services-7.jpg',
                    description:  'For stone mining, we get the help of experts who have a good knowledge of stones and their mining.'
                  },
                  {
                    title: 'Stone Mining',
                    image: 'img/services/services-8.jpg',
                    description:  'We also provide the service of different kinds of stone mining and polish them to utilize in jewelry.'
                  },
                  {
                    title: 'Buy Stone Mine',
                    image: 'img/services/services-5.jpg',
                    description: 'Stonearn not just made jewelry from stone mines but also mines in which stones were discovered and then sold them.'
                  },
                  {
                    title: 'All Stone Jewelary',
                    image: 'img/services/services-4.jpg',
                    description: 'We provide you with all kinds of stone jewelry in unique and modern designs with antique Gems.'
                  },
                  {
                    title: 'Custom Designs',
                    image: 'img/services/services-9.jpg',
                    description: 'We encourage our clients to order jewelry with custom designs or changes that they want.'
                  },
                  {
                    title: 'Fix Raw Designs',
                    image: 'img/services/services-6.jpg',
                    description: 'Stonearn fixes the problem of each stone jewelry and gives finishing to your raw designs.'
                  }
              ]
        };
    },
    components: { QuickService, Button, PlanCard, OurServices, OurClients, RewardCard},
    methods: {
        onObserve() {
            const sections = document.querySelectorAll("div.lazyload");
            const options = {
                threshold: 0.5,
            };
            const showComponent = (comp) => {
                this.lazyLoadElement[comp] = true;
            };
            const observer = new IntersectionObserver(function (entries, observer) {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        showComponent(entry.target.id);
                    }
                });
            }, options);
            sections.forEach((section) => {
                observer.observe(section);
            });
        },
    },
    mounted() {
        this.onObserve();
    },
};
</script>
<style>

h1{
    font-weight: bolder;
    color: #6f5ea9;
}
.reward-card-container h4{
    font-weight: bold;
    justify-content: center;
    color: #6f5ea9;
}
.li-color{
    font-weight: bold;
    font-size: large;
    text-align: center;
    justify-content: space-around;
    color: black;
    list-style: none;
    font-size: small;
    text-align: center;
}
.reward-card-container ul > li{
    list-style: none;
    font-size: small;
    text-align: center;
}

.reward-heading{
    font-weight:800;
    color:#6f5ea9;
    text-decoration: underline;

}
.reward-card{
    transition: all 0.2s ease;
    cursor: pointer;
}

.reward-card:hover{
    box-shadow: 5px 6px 6px 2px #e9ecef;
    transform: scale(1.1);
    border: 2px solid #6f5ea9;
}

</style>
