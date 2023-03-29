<template>
  <div class="todo-item">
    <div v-if="!isEditing">
      <input type="checkbox" v-model="completed" @change="$emit('update-todo', {id, todo: {text, description, completed}})" class="checkbox">
      <span :class="{ completed: completed }" class="text">{{ text }}</span>
      <span v-if="description" class="description">- {{ description }}</span>
      <button @click="$emit('delete-todo', id)" class="btn-delete">X</button>
      <button @click="isEditing = true" class="btn-edit"> <span>&#9999;</span> </button>
    </div>
    <div v-else>
      <input type="text" v-model="text" class="input-text">
      <input type="text" v-model="description" class="input-text">
      <button @click="isEditing = false; $emit('update-todo', {id, todo: {text, description, completed}})" class="btn-save">Save</button>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    todo: Object,
    id: Number,
  },
  data() {
    return {
      completed: this.todo.completed,
      text: this.todo.text,
      description: this.todo.description,
      isEditing: false,
    };
  },
};
</script>
<style>
* {
  box-shadow: 0 0 0px 0px rgb(157 253 209 / 43%);
  box-sizing: border-box;
}
.todo-item {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  list-style-type: none;
  background: #eee;
  font-size: 25px;
  transition: 0.2s;
}
.todo-item:nth-child(odd) {
  background: #f9f9f9;
}
.todo-item:hover {
  background: #ddd;
}
.checkbox {
  margin-right: 0.5rem;
}
.text {
  flex-grow: 1;
  font-size: 1.5rem;
}
.completed {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}
.description {
  font-size: 1rem;
  color: gray;
  margin-top: 0.5rem;
}
.btn-delete{
  position: absolute;
    right: 0;
    cursor: pointer;
    border-radius: 5px;
    border: none;
}
.btn-delete:hover {
  background-color: #f44336;
  color: white;
}
.btn-edit{
  cursor: pointer;
    border-radius: 5px;
    border: none;
}
.btn-edit:hover{
  background-color: #79f704;
  color: white;
}
.btn-save{
  cursor: pointer;
    border-radius: 5px;
    border: none;
}
.btn-save:hover{
  background-color: #79f704;
  color: white;
}
</style>

