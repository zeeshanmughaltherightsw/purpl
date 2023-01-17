<script setup>
import Checkbox from "@/Components/Checkbox.vue";
import GuestLayout from "@/Layouts/GuestLayout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Head, Link, useForm } from "@inertiajs/inertia-vue3";
import { onMounted } from '@vue/runtime-core';

defineProps({
  canResetPassword: Boolean,
  status: String,
});

const form = useForm({
  email: "",
  password: "",
  remember: false,
});

const submit = () => {
  form.post(route("login"), {
    onFinish: () => form.reset("password"),
  });
};

onMounted(() => {
  NioApp.PassSwitch()
});

</script>

<template>
  <GuestLayout>
    <Head title="Log in" />
    <div class="nk-content">
    <div class="nk-block nk-block-middle nk-auth-body wide-xs">
        <div class="card">
          <div class="card-inner card-inner-lg">
            <form @submit.prevent="submit">
              <div class="form-group">
                <div class="form-label-group">
                  <label class="form-label" for="default-01"
                    >Email</label
                  >
                </div>
                <div class="form-control-wrap">
                  <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full form-control form-control-lg"
                    v-model="form.email"
                    required
                    autofocus
                    autocomplete="username"
                  />
                  <InputError class="mt-2" :message="form.errors.email" />
                </div>
              </div>
              <div class="form-group">
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
                    autocomplete="current-password"
                    placeholder="Enter your password"
                  />
                  <InputError class="mt-2" :message="form.errors.password" />
                </div>
              </div>
              <div class="form-group">
                <PrimaryButton
                  class="btn btn-lg btn-primary btn-block"
                  :class="{ 'opacity-25': form.processing }"
                  :disabled="form.processing"
                >
                  Login
                </PrimaryButton>
              </div>
            </form>
            <div class="form-note-s2 text-center pt-4">
              New on our platform?
              <Link :href="route('register')"
                >Create an account</Link
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </GuestLayout>
</template>
