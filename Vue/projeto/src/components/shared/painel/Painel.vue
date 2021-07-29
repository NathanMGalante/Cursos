<template>
  <div class="painel">
    <h2
      class="painel-title"
      @dblclick="visible = !visible"
    >{{ title }}</h2>
    <transition class="painel-fade">
      <div
        class="painel-contents"
        v-show="visible"
      >
        <slot></slot>
      </div>
    </transition>
  </div>
</template>

<script>
export default {
  data() {
    return {
      visible: true,
    };
  },
  props: ["title"],
};
</script>

<style scoped lang="scss">
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
    user-select: none;
  }

	&-fade{
		opacity: 0;
		transition: {
			opacity: 1;
		};
	}
}
</style>