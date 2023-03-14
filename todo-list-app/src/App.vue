<template>
  <div>
    <h1>Todo List</h1>
    <form @submit.prevent="addTodo">
      <input type="text" v-model="newTodoText">
      <button>Add Todo</button>
    </form>
    <div v-if="todos.length === 0">No todos yet!</div>
    <div v-else>
      <todo-item
        v-for="(todo, index) in todos"
        :key="index"
        :todo="todo"
        @delete-todo="deleteTodo(index)"
      ></todo-item>
    </div>
  </div>
</template>

<script>
import TodoItem from './components/TodoItem.vue';

export default {
  components: {
    TodoItem,
  },
  data() {
    return {
      newTodoText: '',
      todos: [],
    };
  },
  methods: {
    addTodo() {
      console.log(111)

      if (this.newTodoText.trim() !== '') {
        this.todos.push({
          text: this.newTodoText.trim(),
          completed: false,
        });
        this.newTodoText = '';
      }
    },
    deleteTodo(index) {
      console.log(222)

      this.todos.splice(index, 1);
    },
  },
};
</script>
