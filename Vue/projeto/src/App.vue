<template>
  <div class="body">
    <ul class="list">
      <li
        class="list-item"
        v-for="foto of fotos"
      >
        <div class="painel">
          <h2 class="painel-title">{{ foto.titulo }}</h2>
          <div class="painel-contents">
            <img
              :src="foto.url"
              :alt="foto.title"
            >
          </div>
        </div>
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
.painel {
  width: 200px;
  height: 100%;
  padding: 0 auto;
  border: solid 2px grey;
  display: inline-block;
  margin: 5px;
  box-shadow: 5px 5px 10px grey;
  vertical-align: top;
  text-align: center;

  &-title {
    text-align: center;
    border: solid 2px;
    background: lightblue;
    margin: 0 0 15px 0;
    text-transform: uppercase;
  }

  img {
    width: 100%;
  }
}
</style>
