<template>
  <div class="body">
    <ul class="list">
      <li
        class="list-item"
        v-for="foto of fotos"
      >
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
      fotos: [],
    };
  },
  created() {
    this.$http
      .get("http://localhost:3000/v1/fotos")
      .then((res) => res.json())
      .then((fotos) => (this.fotos = fotos));
  },
};
</script>

<style lang="scss">
.body {
  font-family: Helvetica, sans-serif;
  width: 96%;
  margin: 0 auto;
}
.list {
  list-style: none;

  &-item {
    display: inline-block;
  }
}
</style>
