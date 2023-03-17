<template>
  <div>
    <h1>Todo List</h1>
    <form @submit.prevent="addTodo">
      <input type="text" v-model="newTodoText" placeholder="Enter a todo">
      <input type="text" v-model="newTodoDesc" placeholder="Enter a description">
      <button>Add Todo</button>
    </form>
    <div v-if="todos.length === 0">No todos yet!</div>
    <div v-else>
      <todo-item
        v-for="(todo) in todos"
        :key="todo.id"
        :todo="todo"
        @delete-todo="deleteTodo(todo.id)"
        @update-todo="updateTodo({id: todo.id, todo})"
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
      newTodoDesc: '',
      todos: [],
    };
  },
  methods: {
    addTodo() {
      if (this.newTodoText.trim() !== '') {
        this.todos.push({
          id: Date.now(),
          text: this.newTodoText.trim(),
          description: this.newTodoDesc.trim(),
          completed: false,
        });
        this.newTodoText = '';
        this.newTodoDesc = '';
      }
    },
    deleteTodo(id) {
      this.todos = this.todos.filter(todo => todo.id !== id);
    },
    updateTodo({ id, todo }) {
      this.todos = this.todos.map(todoItem => {
        if (todoItem.id === id) {
          return { ...todoItem, ...todo };
        }
        return todoItem;
      });
    },
  },
};
</script>
