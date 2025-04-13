<script>
  import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
  import { Head, Link } from '@inertiajs/vue3'
  import MainLayout from '@/Layouts/MainLayout.vue'
  export default {
    components: {
      AuthenticatedLayout, Head, Link, MainLayout
    },
    props: [
      'post',
    ]
  }
</script>

<template>

  <Head title="Show Post" />

  <AuthenticatedLayout>
    <MainLayout>
      <h1 class="text-lg mb-8">Show Post</h1>
      <div class="mb-8">
        <Link :href="route('posts.index')" class="m-1 cursor-pointer bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-6 border rounded-full">Back</Link>
        <Link :href="route('posts.edit', post.id)" class="m-1 hover:bg-white hover:text-sky-500 py-2 px-6 bg-sky-500 border border-sky-500 rounded-full text-center text-white">Edit Post</Link>
      </div>

      <div v-if="post">
        <div class="mt-8 pt-8 border-t border-gray-300">
          <div>id: {{ post.id }}</div>
          <div>title: {{ post.title }}</div>
          <div>content: {{ post.content }}</div>
          <div>created_at: {{ post.created_at }}</div>
          <div>updated_at: {{ post.updated_at }}</div>
        </div>
      </div>
    </MainLayout>
  </AuthenticatedLayout>
</template>

<style scoped></style>