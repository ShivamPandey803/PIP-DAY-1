<template>
  <div>
    <div v-if="!isEditing">
      <input type="checkbox" v-model="completed" @change="$emit('update-todo', {index, todo: {text, completed}})">
      <span :class="{ completed: completed }">{{ text }}</span>
      <button @click="$emit('delete-todo')">X</button>
      <button @click="isEditing = true">Edit</button>
    </div>
    <div v-else>
      <input type="text" v-model="text">
      <button @click="isEditing = false; $emit('update-todo', {index, todo: {text, completed}})">Save</button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    todo: Object,
    index: Number,
  },
  data() {
    return {
      completed: this.todo.completed,
      text: this.todo.text,
      isEditing: false,
    };
  },
};
</script>

<style>
.completed {
  text-decoration: line-through;
}
</style>
