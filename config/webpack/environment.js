const { environment } = require('@rails/webpacker')
/* absolute path */
const customConfig = require('./custom')
environment.config.merge(customConfig)

/**
 * 1) https://stackoverflow.com/questions/49348365/webpack-4-size-exceeds-the-recommended-limit-244-kib
 * 2) https://stackoverflow.com/questions/61212381/webpacker-asset-pack-size
 */
environment.config.merge({
  performance: {
    hints: false,
    maxEntrypointSize: 512000,
    maxAssetSize: 512000
  }
})

module.exports = environment
