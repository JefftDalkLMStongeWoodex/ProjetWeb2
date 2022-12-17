<script setup>
import { useForm } from '@inertiajs/inertia-vue3'
import Select from '@/Components/Select.vue';
const props = defineProps({
    taxes: Object,
    provinces: Object,
    liste: Object
})
const form = useForm({
  provinces: '',
  modeExpedition: ''
})
</script>
<script>
export default{
    computed:{
        getTotal() {
            let total = 0;
            for(let item of this.$props.liste) {
                total += item.prix;
            }
            return total
        },
        // getTaxe() {
        //     return this.$setup.form
        // }
    }
}
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
                <input type="radio" name="modeExpedition" v-model="modeExpedition" id="livraison" value="1">
                <label for="livraison">
                    Expédition au domicile
                </label>
                <br>
                <input type="radio" name="modeExpedition" v-model="modeExpedition" id="ramassage" value="2">
                <label for="ramassage">
                    Ramassage aux concessionnaire
                </label>
            </div>
        </form>
        <section>
            {{form.modeExpedition}}
        </section>
    </aside>
</template>
<style scoped>
</style>
