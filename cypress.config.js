const { defineConfig } = require('cypress')

module.exports = defineConfig({
  screenshotsFolder: 'tmp/cypress_screenshots',
  trashAssetsBeforeRuns: false,
  videosFolder: 'tmp/cypress_videos',
})
