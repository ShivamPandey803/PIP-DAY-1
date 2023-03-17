
<template>
  <div>
    <div v-if="!isEditing">
      <input type="checkbox" v-model="completed" @change="$emit('update-todo', {id, todo: {text, description, completed}})">
      <span :class="{ completed: completed }">{{ text }}</span>
      <span v-if="description">- {{ description }}</span>
      <button @click="$emit('delete-todo', id)">X</button>
      <button @click="isEditing = true">Edit</button>
    </div>
    <div v-else>
      <input type="text" v-model="text">
      <input type="text" v-model="description">
      <button @click="isEditing = false; $emit('update-todo', {id, todo: {text, description, completed}})">Save</button>
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
h1 {
    font-size: 2.5rem;
    margin-bottom: 1.5rem;
    text-align: center;
  }
  
  form {
    display: flex;
    justify-content: center;
    margin-bottom: 1.5rem;
  }
  
  input[type="text"] {
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    margin-right: 1rem;
    padding: 0.5rem;
    width: 50%;
  }
  
  button {
    background-color: #4CAF50;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    font-size: 1rem;
    padding: 0.5rem;
  }
  
  button:hover {
    background-color: #3e8e41;
  }
  
  .todo-item {
    align-items: center;
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.5rem;
  }
  
  .todo-item span {
    font-size: 1.2rem;
    margin-right: 1rem;
  }
  
  .todo-item button {
    background-color: #f44336;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    font-size: 1rem;
    margin-right: 1rem;
    padding: 0.5rem;
  }
  
  .todo-item button:hover {
    background-color: #d32f2f;
  }
  
  .completed {
    text-decoration: line-through;
  }
  .description {
  font-size: 0.8rem;
  color: gray;
  margin-top: 0.5rem;
}
</style>





