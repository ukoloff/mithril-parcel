const livescript = require('livescript')
const JSAsset = require('parcel-bundler/src/assets/JSAsset')

module.exports = class LiveScriptAsset extends JSAsset {
  parse(code) {
    return super.parse(livescript.compile(code, {
      bare: true
    }))
  }
}
