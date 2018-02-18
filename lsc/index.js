module.exports = function() {

}

require('fs').writeFile(__dirname + '/log', new Date, function(){})
