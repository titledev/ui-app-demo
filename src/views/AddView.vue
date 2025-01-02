<template>
  <div class="add-page">
    <h1>Add Page</h1>
    <label for="A">A: </label>
    <input type="number" v-model="a" />
    <label for="B">B: </label>
    <input type="number" v-model="b" />
    <button @click="addCalculate">Calculate</button>

    <h2>Result : {{ result }}</h2>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useApiStore } from '@/stores/api'
const apiStore = useApiStore()

const a = ref(0)
const b = ref(0)
const result = ref(null)

const addCalculate = async () => {
  let response = await apiStore.addNumbers(a.value, b.value)
  //   console.log('response', response)
  result.value = response
}

onMounted(() => {
  console.log('apiStore', apiStore)
})
</script>

<style lang="css" scoped></style>
