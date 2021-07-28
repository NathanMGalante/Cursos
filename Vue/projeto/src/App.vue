<template>
  <div>
    <ul>
      <li v-for="foto of fotos">
        <img
          :src="foto.url"
          :alt="foto.title"
        >
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      fotos: [
        {
          title: "imagem 01",
          url: "https://upload.wikimedia.org/wikipedia/en/9/95/Test_image.jpg",
        },
        {
          title: "imagem 02",
          url: "https://upload.wikimedia.org/wikipedia/en/9/95/Test_image.jpg",
        },
        {
          title: "imagem 03",
          url: "https://upload.wikimedia.org/wikipedia/en/9/95/Test_image.jpg",
        },
      ],
    }
  }
};
</script>

<style lang="scss">
</style>
