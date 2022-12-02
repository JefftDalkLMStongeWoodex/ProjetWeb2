<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>

  <Head title="Contactez-nous" />

  <AppLayout>
    <div class="mt-medium">

      <div class="grid grid-cols-2 gap-8">
          <div class="">
            <h1 class="title">VDO Inc.</h1>
            <p class="text">3800 R. Sherbrooke E, Montréal, QC H1X 2A2</p>
            <p class="text">514-254-7131</p>
            <p class="text">Si vous avez des questions concernant nos véhicules, y compris des sélections de voitures
              d'occasion,
              n'hésitez pas à nous les poser. Chez VDO Inc, il n'y a pas de questions idiotes. Nous sommes là pour
              répondre
              à toutes vos questions et résoudre tous les problèmes que vous pourriez avoir.
            </p>
            <p class=" text mt-2">
              Utilisez notre formulaire de contact pour exposer votre question ou votre demande. Nous examinerons et
              répondrons dès que possible en utilisant votre méthode de communication préférée.
            </p>
          </div>

          <div>
            <h1 class="title">Heures d'ouverture</h1>
            <div class="">
              <table class="border-separate border-spacing-5 border border-slate-500">
                <tbody>
                  <tr class="text-center">
                    <th class="border border-slate-700">Lundi au Vendredi</th>
                    <td class="border border-slate-700">10:00 - 18:00</td>
                  </tr>
                  <tr class="text-center">
                    <th class="border border-slate-700">Samedi</th>
                    <td class="border border-slate-700">10:00 - 16:00</td>
                  </tr>
                  <tr class="text-center">
                    <th class="border border-slate-700">Dimanche</th>
                    <td class="border border-slate-700">Fermé</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <div class="mt-medium">
            <h2 class=""> Pour toute question </h2>
            <form action="#" class="space-y-4">
              <div>
                <label for="email" class="block mb-2">Courriel</label>

                <input type="email" id="email"
                  class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
                  required>
              </div>
              <div>
                <label for="subject" class="block mb-2">Sujet</label>
                <input type="text" id="subject"
                  class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
                  placeholder="Let us know how we can help you" required>
              </div>
              <div class="sm:col-span-2">
                <label for="message" class="block mb-2 ">Votre message</label>

                <textarea id="message" rows="4"
                  class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">
                </textarea>
              </div>
              <button>Submit</button>
            </form>
          </div>

          <div>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Neque excepturi iure ipsum ab! Libero
              reiciendis
              dolorum animi quasi inventore delectus distinctio, amet maxime, a rem quam cupiditate dicta cum nobis!</p>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Neque excepturi iure ipsum ab! Libero
              reiciendis
              dolorum animi quasi inventore delectus distinctio, amet maxime, a rem quam cupiditate dicta cum nobis!</p>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Neque excepturi iure ipsum ab! Libero
              reiciendis
              dolorum animi quasi inventore delectus distinctio, amet maxime, a rem quam cupiditate dicta cum nobis!</p>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Neque excepturi iure ipsum ab! Libero
              reiciendis
              dolorum animi quasi inventore delectus distinctio, amet maxime, a rem quam cupiditate dicta cum nobis!</p>
          </div>
        </div>
      </div>
</AppLayout>

</template>

<style>
table {
  width: 100%;
}

.mt-medium {
  margin-top: 5rem;
}

.title {
  color: var(--couleur-secondaire);
  font-family: var(--police-titre);
  font-size: 1.5rem;
}

.text {
  color: var(--couleur-secondaire);
}
</style>