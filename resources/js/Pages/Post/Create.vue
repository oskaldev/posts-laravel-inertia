<script>
  import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
  import { Head } from '@inertiajs/vue3'
  import { Link } from '@inertiajs/vue3'
  export default {
    data() {
      return {
        title: null,
        content: null
      }
    },
    components: {
      AuthenticatedLayout, Head, Link
    },
    props: [
      'errors'
    ],
    methods: {
      store() {
        this.$inertia.post('/posts', { title: this.title, content: this.content })
      }
    }
  }
</script>

<template>

  <Head title="Create Post" />

  <AuthenticatedLayout>
    <div class="mx-auto my-10">
      <h1 class="text-lg text-center mb-8">Create Post</h1>
      <div class="md:w-1/2 mx-auto">
        <div class="bg-white shadow-md rounded-lg p-6">
          <div class="flex flex-col mb-4 space-y-6">
            <input v-model="title" type="text" class="w-full px-4 py-2 rounded-lg border-gray-300 focus:outline-none focus:border-blue-500" placeholder="Add title" required>
            <div v-if="errors.title" class="text-red-600">{{ errors.title }}</div>
            <textarea v-model="content" class="w-full px-4 py-2 rounded-lg border-gray-300 focus:outline-none focus:border-blue-500" placeholder="Add content" required></textarea>
            <div v-if="errors.content" class="text-red-600">{{ errors.content }}</div>
            <div class="flex justify-evenly">
              <Link @click.prevent="store" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 border rounded-full cursor-pointer">
              Add
              </Link>
              <Link :href="route('posts.index')" class="cursor-pointer bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-6 border rounded-full">
              Back
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </AuthenticatedLayout>
</template>

<style scoped></style>