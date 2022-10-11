<script setup>
import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/inertia-vue3";

const form = useForm({
  name: "",
  email: "",
  password: "",
  password_confirmation: "",
  terms: false,
});

const submit = () => {
  form.post(route("register"), {
    onFinish: () => form.reset("password", "password_confirmation"),
  });
};
</script>

<template>
  <GuestLayout>
    <Head title="Register" />

    <div class="nk-content">
      <div class="nk-block nk-block-middle nk-auth-body wide-xs">
        <div class="brand-logo pb-4 text-center">
          <a href="html/index.html" class="logo-link">
            <img
              class="logo-light logo-img logo-img-lg"
              src="/images/logo.png"
              srcset="/images/logo2x.png 2x"
              alt="logo"
            />
            <img
              class="logo-dark logo-img logo-img-lg"
              src="/images/logo-dark.png"
              srcset="/images/logo-dark2x.png 2x"
              alt="logo-dark"
            />
          </a>
        </div>
        <div class="card">
          <div class="card-inner card-inner-lg">
            <div class="nk-block-head">
              <div class="nk-block-head-content">
                <h4 class="nk-block-title">Sign-Up</h4>
                <div class="nk-block-des"></div>
              </div>
            </div>
            <form @submit.prevent="submit">
              <div class="form-group">
                <div class="form-label-group">
                  <label class="form-label" for="default-01">Name</label>
                </div>
                <div class="form-control-wrap">

                  <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full form-control form-control-lg"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                  />
                  <InputError class="mt-2" :message="form.errors.name" />
                </div>
              </div>

              <div class="form-group">
                <div class="form-label-group">
                  <label class="form-label" for="default-01">Email</label>
                </div>
                <div class="form-control-wrap">
                  <!-- <input type="text" class="form-control form-control-lg" id="default-01" placeholder="Enter your email address or username"> -->
                  <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full form-control form-control-lg"
                    v-model="form.email"
                    required
                    autocomplete="username"
                  />
                  <InputError class="mt-2" :message="form.errors.email" />
                </div>
              </div>
              <div class="form-group">
                <div class="form-label-group">
                  <label class="form-label" for="password">Password</label>
                  <a
                    class="link link-primary link-sm"
                    href="html/pages/auths/auth-reset-v2.html"
                    >Forgot Password?</a
                  >
                </div>
                <div class="form-control-wrap">
                  <a
                    href="#"
                    class="form-icon form-icon-right passcode-switch lg"
                    data-target="password"
                  >
                    <em class="passcode-icon icon-show icon ni ni-eye"></em>
                    <em class="passcode-icon icon-hide icon ni ni-eye-off"></em>
                  </a>
                  <TextInput
                    id="password"
                    type="password"
                    class="mt-1 block w-full form-control form-control-lg"
                    v-model="form.password"
                    required
                    autocomplete="new-password"
                  />
                  <InputError class="mt-2" :message="form.errors.password" />
                </div>
              </div>

              <div class="form-group">
                <div class="form-label-group">
                  <label class="form-label" for="default-01"
                    >Confrim Password</label
                  >
                </div>
                <div class="form-control-wrap">

                  <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full form-control form-control-lg"
                    v-model="form.password_confirmation"
                    required
                    autofocus
                    autocomplete="name"
                  />
                  <InputError
                    class="mt-2"
                    :message="form.errors.password_confirmation"
                  />
                </div>
              </div>
              <div class="flex items-center mt-4">
                <Link
                  :href="route('login')"
                  class="underline text-sm text-gray-600 hover:text-gray-900"
                >
                  Already registered?
                </Link>

                <PrimaryButton
                  class="ml-4"
                  :class="{ 'opacity-25': form.processing }"
                  :disabled="form.processing"
                >
                  Register
                </PrimaryButton>
              </div>
            </form>

            <div class="text-center pt-4 pb-3">
              <h6 class="overline-title overline-title-sap"><span>OR</span></h6>
            </div>
            <ul class="nav justify-center gx-4">
              <li class="nav-item">
                <a class="nav-link" href="#">Facebook</a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#">Google</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="nk-footer nk-auth-footer-full">
        <div class="container wide-lg">
          <div class="row g-3">
            <div class="col-lg-6 order-lg-last">
              <ul
                class="nav nav-sm justify-content-center justify-content-lg-end"
              >
                <li class="nav-item">
                  <a class="nav-link" href="#">Terms & Condition</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Privacy Policy</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Help</a>
                </li>
                <li class="nav-item dropup">
                  <a
                    class="
                      dropdown-toggle dropdown-indicator
                      has-indicator
                      nav-link
                    "
                    data-toggle="dropdown"
                    data-offset="0,10"
                    ><span>English</span></a
                  >
                  <div
                    class="dropdown-menu dropdown-menu-sm dropdown-menu-right"
                  >
                    <ul class="language-list">
                      <li>
                        <a href="#" class="language-item">
                          <img
                            src="/images/flags/english.png"
                            alt=""
                            class="language-flag"
                          />
                          <span class="language-name">English</span>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="language-item">
                          <img
                            src="/images/flags/spanish.png"
                            alt=""
                            class="language-flag"
                          />
                          <span class="language-name">Español</span>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="language-item">
                          <img
                            src="/images/flags/french.png"
                            alt=""
                            class="language-flag"
                          />
                          <span class="language-name">Français</span>
                        </a>
                      </li>
                      <li>
                        <a href="#" class="language-item">
                          <img
                            src="/images/flags/turkey.png"
                            alt=""
                            class="language-flag"
                          />
                          <span class="language-name">Türkçe</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
            <div class="col-lg-6">
              <div class="nk-block-content text-center text-lg-left">
                <p class="text-soft">
                  &copy; 2022 DashLite. All Rights Reserved.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </GuestLayout>
</template>
