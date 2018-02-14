###
Game of 15
###
import m from 'mithril'

shuffle = (arr)->
  i = arr.length
  while i
    x = arr[j = Math.floor Math.random() * i--]
    arr[j] = arr[i]
    arr[i] = x
  arr

export default
  oninit: ->
    @square = shuffle(i for i in [0..15])
    return

  view: (vnode)->
    square = @square
    n = 0
    m 'table.x15',
      m 'tbody',
        for y in [0..3]
          m 'tr',
            for x in [0..3]
              m 'td', if cell = square[n++]
                  m 'button',
                    onclick: ->
                    cell
                else
                  []
