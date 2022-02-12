const { environment } = require('@rails/webpacker')
/* absolute path */
const customConfig = require('./custom')
environment.config.merge(customConfig)

module.exports = environment
