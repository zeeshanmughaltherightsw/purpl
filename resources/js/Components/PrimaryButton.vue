<script setup>
defineProps({
    type: {
        type: String,
        default: 'submit',
    },
});
</script>

<template>
    <button :type="type" class="d-flex btn-primary align-items-center px-4 py-2  border border-transparent rounded font-semibold text-xs text-white uppercase tracking-widest transition ease-in-out duration-150">
        <slot />
    </button>
</template>
