<template>
  <div>
    <input type="checkbox" v-model="completed">
    <span :class="{ completed: completed }">{{ text }}</span>
    <button @click="$emit('delete-todo')">X</button>
  </div>
</template>

<script>
export default {
  props: {
    todo: Object,
  },
  data() {
    return {
      completed: this.todo.completed,
      text: this.todo.text,
    };
  },
};
</script>

<style>
.completed {
  text-decoration: line-through;
}
</style>
