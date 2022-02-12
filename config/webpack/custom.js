const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/javascript'),
      '@public': path.resolve(__dirname, '..', '..', 'app/javascript/public'),
      '@components': path.resolve(__dirname, '..', '..', 'app/javascript/bundles')
    }
  }
}