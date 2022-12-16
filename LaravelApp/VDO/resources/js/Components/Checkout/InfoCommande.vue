<script setup>
import { useForm } from '@inertiajs/inertia-vue3'
import Select from '@/Components/Select.vue';
const props = defineProps({
    taxes: Object,
    provinces: Object
})
const form = useForm({
  provinces: ''
})
</script>
<script>
</script>
<template>
    <aside>
        <form action="" @submit.prevent="submit">
            <label for="provinces_id">
                Veuillez selectionner votre province:
            </label>
            <br>
            <Select
            :options = "props.provinces"
            colonneAffichee = 'nom'
            v-model = "form.provinces"
            name="provinces_id"
            />
            <div>
                <strong>Comment souhaité vous recevoir la commande?</strong>
                <br>
                <input type="radio" name="livraison" id="">
                <label for="livraison">
                    Expédition au domicile
                </label>
                <br>
                <input type="radio" name="ramassage" id="">
                <label for="ramassage">
                    Ramassage aux concessionnaire 
                </label>
            </div>
        </form>
        <section>
            
        </section>
    </aside>
</template>
<style scoped>
</style>