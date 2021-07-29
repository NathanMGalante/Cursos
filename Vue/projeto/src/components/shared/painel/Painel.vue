<template>
  <div class="painel">
    <h2 class="painel-title">{{ title }}</h2>
    <slot class="painel-contents">
    </slot>
  </div>
</template>

<script>
export default {
  props: ["title"],
};
</script>

<style lang="scss">
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
}
</style>