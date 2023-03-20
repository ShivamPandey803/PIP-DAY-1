<template>
  <div class="app">
    <h1 class="title">Todo List</h1>
    <form @submit.prevent="addTodo" class="form">
      <input type="text" v-model="newTodoText" placeholder="Enter a todo" class="input-text">
      <input type="text" v-model="newTodoDesc" placeholder="Enter a description" class="input-text">
      <button class="btn-add">Add Todo</button>
    </form>
    <div v-if="todos.length === 0" class="no-todos">No todos yet!</div>
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

<style>
.app {
  max-width: 500px;
  margin: 0 auto;
}

.title {
  background-color: #f44336;
  padding: 30px 40px;
  color: white;
  text-align: center;

}

.form {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
}

.input-text {
  flex-grow: 1;
  padding: 0.5rem;
  border-radius: 5px;
  border: none;
  font-size: 1rem;
  margin-right: 0.5rem;
}

.btn-add {
  padding: 2px;
    margin: 0;
    max-width: 100%;
    overflow-x: hidden;
    position: relative;
    display: block;
    background-color: #3cb371;
    border-radius: 5px;
    color: #fff;
    border: none;
    cursor: pointer;
}

.no-todos {
  text-align: center;
  font-size: 1rem;
  color: gray;
  margin-top: 1rem;
}
</style>

