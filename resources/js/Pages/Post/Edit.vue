<script>
  import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
  import { Head } from '@inertiajs/vue3'
  import { Link } from '@inertiajs/vue3'
  export default {
    data() {
      return {
        id: this.post.id,
        title: this.post.title,
        content: this.post.content,
      }
    },
    props: [
      'post'
    ],
    components: {
      AuthenticatedLayout, Head, Link
    },
    methods: {
      update() {
        this.$inertia.patch(`/posts/${this.id}`, { title: this.title, content: this.content })
      }
    }
  }
</script>

<template>

  <Head title="Edit Post" />

  <AuthenticatedLayout>
    <div class="mx-auto my-10">
      <h1 class="text-lg text-center mb-8">Edit Post</h1>
      <div class="md:w-1/2 mx-auto">
        <div class="bg-white shadow-md rounded-lg p-6">
          <div class="flex flex-col mb-4 space-y-6">
            <input v-model="title" type="text" class="w-full px-4 py-2 rounded-lg border-gray-300 focus:outline-none focus:border-blue-500" placeholder="Add title" required>
            <textarea v-model="content" class="w-full px-4 py-2 rounded-lg border-gray-300 focus:outline-none focus:border-blue-500" placeholder="Add content" required></textarea>
            <div class="flex justify-evenly">
              <div @click.prevent="update" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 border rounded-full cursor-pointer">
                Update
              </div>
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