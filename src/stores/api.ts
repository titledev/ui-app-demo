import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

import axios from 'axios'

export const useApiStore = defineStore('api', () => {
  async function addNumbers(a: number, b: number) {
    try {
      const response = await axios.post('http://localhost:8080/add', { a, b })
      return response.data
    } catch (error) {
      console.error('Error adding values:', error)
      throw error
    }
  }

  return { addNumbers }
})

export const testStore = defineStore('test', () => {
  function test() {
    console.log('test')
  }

  return { test }
})
