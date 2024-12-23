// eslint.config.js
import globals from 'globals'
import js from '@eslint/js'

export default [
  js.configs.recommended,
  {
    ignores: ['node_modules', 'dist', 'public', '.nuxt']
  },
  {
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      globals: {
        ...globals.browser,
        ...globals.node
      }
    },
    rules: {
      'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
      'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
      'prettier/prettier': process.env.NODE_ENV === 'production' ? 'error' : 'off'
    }
  }
]
