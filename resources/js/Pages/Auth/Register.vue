<script setup>
import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/inertia-vue3";

const form = useForm({
  name: "",
  username: "",
  address: "",
  phone_no: "",
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
        <div class="card">
          <div class="card-inner card-inner-lg">
            <div class="nk-block-head">
              <div class="nk-block-head-content">
                <h4 class="nk-block-title">Sign-Up</h4>
                <div class="nk-block-des"></div>
              </div>
            </div>
            <form @submit.prevent="submit">
              <div class="row">
                <div class="col-12">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Full name</label>
                    </div>
                    <div class="form-control-wrap">

                      <TextInput id="name" type="text" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.name" required autofocus autocomplete="name" />
                      <InputError class="mt-2" :message="form.errors.name" />
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Username</label>
                    </div>
                    <div class="form-control-wrap">

                      <TextInput id="username" type="text" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.username" required autofocus autocomplete="username" />
                      <InputError class="mt-2" :message="form.errors.username" />
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Email</label>
                    </div>
                    <div class="form-control-wrap">
                      <!-- <input type="text" class="form-control form-control-lg" id="default-01" placeholder="Enter your email address or username"> -->
                      <TextInput id="email" type="email" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.email" required autocomplete="email" />
                      <InputError class="mt-2" :message="form.errors.email" />
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Phone</label>
                    </div>
                    <div class="form-control-wrap">

                      <TextInput id="phone" type="text" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.phone_no" required autofocus autocomplete="phone" />
                      <InputError class="mt-2" :message="form.errors.phone_no" />
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="password">Password</label>
                      <a class="link link-primary link-sm" href="html/pages/auths/auth-reset-v2.html">Forgot Password?</a>
                    </div>
                    <div class="form-control-wrap">
                      <a href="#" class="form-icon form-icon-right passcode-switch lg" data-target="password">
                        <em class="passcode-icon icon-show icon ni ni-eye"></em>
                        <em class="passcode-icon icon-hide icon ni ni-eye-off"></em>
                      </a>
                      <TextInput id="password" type="password" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.password" required autocomplete="new-password" />
                      <InputError class="mt-2" :message="form.errors.password" />
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Confrim Password</label>
                    </div>
                    <div class="form-control-wrap">

                      <TextInput id="confirm_password" type="text" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.password_confirmation" required autofocus autocomplete="name" />
                      <InputError class="mt-2" :message="form.errors.password_confirmation" />
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <div class="form-group">
                    <div class="form-label-group">
                      <label class="form-label" for="default-01">Address</label>
                    </div>
                    <div class="form-control-wrap">

                      <TextInput id="address" type="text" class="mt-1 block w-full form-control form-control-lg"
                        v-model="form.address" required autofocus autocomplete="address" />
                      <InputError class="mt-2" :message="form.errors.address" />
                    </div>
                  </div>
                </div>
              </div>
              <div class="flex items-center mt-4">
                <Link :href="route('login')" class="underline text-sm text-gray-600 hover:text-gray-900">
                Already registered?
                </Link>

                <PrimaryButton class="ml-auto" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                  Register
                </PrimaryButton>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </GuestLayout>
</template>
