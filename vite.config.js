import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'
import yaml from '@modyfi/vite-plugin-yaml'
import viteImagemin from 'vite-plugin-imagemin'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    yaml({
      // Configuração do plugin YAML
      include: ['**/config/**/*.yml', '**/config/**/*.yaml'], // Inclui todos os YAMLs em pastas config
      exclude: ['node_modules/**'], // Exclui node_modules
      defaultMode: 'sync', // Modo síncrono para carregamento
      parseOptions: {
        json: true // Converte para JSON
      }
    })
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
  server: {
    host: '0.0.0.0',
    port: 5173,
    strictPort: true,
    watch: {
      usePolling: true,
      interval: 100
    },
    cors: true,
    hmr: {
      overlay: true,
      clientPort: 443,
      protocol: 'wss',
      timeout: 30000
    }
  },
  preview: {
    host: '0.0.0.0',
    port: 5173,
    strictPort: true
  },
  define: {
    'import.meta.env.VITE_API_URL': JSON.stringify(process.env.API_URL || 'http://localhost:4000')
  },
  // Configuração adicional para garantir que arquivos YAML sejam processados
  optimizeDeps: {
    exclude: ['@modyfi/vite-plugin-yaml']
  },
  build: {
    commonjsOptions: {
      include: [/node_modules/, /config/]
    }
  }
})
