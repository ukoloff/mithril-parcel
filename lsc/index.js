module.exports = function(bundler) {
  bundler.addAssetType('ls', require.resolve('./lsc.js'));
}

