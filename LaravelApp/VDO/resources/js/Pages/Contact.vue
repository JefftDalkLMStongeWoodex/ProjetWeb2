<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>

  <Head title="Contactez-nous" />
  <AppLayout>
    <div class="grid grid-cols-2 gap-1">
      <div>
        <h1>VDO Inc.</h1>
        <p>3800 R. Sherbrooke E, Montréal, QC H1X 2A2</p>
        <p>514-254-7131</p>
        <p>Si vous avez des questions concernant nos véhicules, y compris des sélections de voitures d'occasion,
          n'hésitez pas à nous les poser. Chez VDO Inc, il n'y a pas de questions idiotes. Nous sommes là pour répondre
          à toutes vos questions et résoudre tous les problèmes que vous pourriez avoir.
        </p>
        <p class="mt-2">
          Utilisez notre formulaire de contact pour exposer votre question ou votre demande. Nous examinerons et
          répondrons dès que possible en utilisant votre méthode de communication préférée.
        </p>
      </div>

      <div>
        <h1>Heures d'ouverture</h1>
        <div class="">
          <table class="border-separate border-spacing-2 border border-slate-500">
            <tbody>
              <tr class="">
                <th>Lundi au Vendredi</th>
                <td class="border-r">10:00 - 18:00</td>
              </tr>
              <tr class="">
                <th>Samedi</th>
                <td class="">10:00 - 16:00</td>
              </tr>
              <tr>
                <th>Dimanche</th>
                <td class="">Fermé</td>
              </tr>
            </tbody>
          </table>
          </div>
        </div>
      </div>
  </AppLayout>

</template>