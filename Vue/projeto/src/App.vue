<template>
  <div class="body">
    <ul class="list">
      <li
        class="list-item"
        v-for="foto in fotos"
      >
        <painel
          class="painel"
          :title="foto.titulo"
        >
          <img
            :src="foto.url"
            :alt="foto.titulo"
          >
        </painel>
      </li>
    </ul>
  </div>
</template>

<script>
import Painel from "./components/shared/painel/Painel.vue";
export default {
  data() {
    return {
      fotos: [],
    };
  },
  components: {
    painel: Painel,
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
.painel {
  img {
    width: 100%;
  }
}
</style>
