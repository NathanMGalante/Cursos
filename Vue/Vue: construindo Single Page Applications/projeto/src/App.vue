<template>
  <div class="body">
    <input
      type="search"
      class="filter"
      placeholder="filtro com base no titulo"
      v-model="filter"
    >
    <ul class="list">
      <li
        class="list-item"
        v-for="foto in photoWithFilter"
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
      filter: "",
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
  computed: {
    photoWithFilter() {
      if (this.filter) {
        let exp = new RegExp(this.filter.trim(), "i");
        return this.fotos.filter((foto) => exp.test(foto.titulo));
      }
      return this.fotos;
    },
  },
};
</script>

<style scoped lang="scss">
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
.filter {
  display: block;
  width: 100%;
}
</style>
