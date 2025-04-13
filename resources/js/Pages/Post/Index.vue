<script>
  import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue'
  import { Head, Link } from '@inertiajs/vue3'
  import MainLayout from '@/Layouts/MainLayout.vue'
  export default {
    components: {
      AuthenticatedLayout, Head, Link, MainLayout
    },
    props: [
      'posts',
    ],
    methods: {
      destroy(id) {
        this.$inertia.delete(`/posts/${id}`)
      }
    }
  }
</script>

<template>

  <Head title="Posts" />

  <AuthenticatedLayout>
    <MainLayout>
      <h1 class="text-lg mb-8">Posts</h1>
      <div class="mb-8">
        <Link :href="route('posts.create')" class="hover:bg-white hover:text-sky-500 block p-2 w-32 bg-sky-500 border border-sky-500 rounded-full text-center text-white">Add Post</Link>
      </div>
      <div v-if="posts">
        <div class="mt-8 pt-8 border-t border-gray-300" v-for="(post) in posts" :key="post.id">
          <div>id: {{ post.id }}</div>
          <div>title: {{ post.title }}</div>
          <div>content: {{ post.content }}</div>
          <div class="text-sm">created_at: {{ post.created_at }}</div>
          <div class="text-sm">updated_at: {{ post.updated_at }}</div>
          <div class="text-sm mt-5">
            <Link :href="route('posts.show', post.id)" class="hover:bg-white hover:text-purple-500 p-2 w-32 bg-purple-500 border border-purple-500 rounded-full text-center text-white">Show Post</Link>
          </div>
          <div class="text-sm mt-5">
            <Link :href="route('posts.edit', post.id)" class="hover:bg-white hover:text-sky-500 p-2 w-32 bg-sky-500 border border-sky-500 rounded-full text-center text-white">Edit Post</Link>
          </div>
          <div class="text-sm mt-5">
            <p @click.prevent="destroy(post.id)" class="cursor-pointer hover:bg-white hover:text-red-500 p-2 w-32 bg-red-500 border border-red-500 rounded-full text-center text-white">Delete Post</p>
          </div>
        </div>
      </div>
    </MainLayout>
  </AuthenticatedLayout>
</template>

<style scoped></style>