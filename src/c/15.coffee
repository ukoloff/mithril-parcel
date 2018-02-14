###
Game of 15
###
import m from 'mithril'

shuffle = (arr)->
  i = arr.length
  while i > 0
    x = arr[j = Math.floor Math.random() * i--]
    arr[j] = arr[i]
    arr[i] = x
  arr

active = timer = 0

export default
  oninit: ->
    @start = new Date
    @count = 0
    @square = shuffle(i for i in [0..15])
    return

  view: (vnode)->
    square = @square
    n = 0
    m 'table.x15',
      m 'thead',
        m 'tr',
          m 'td',
            colspan: 4
            oncreate: ->
              unless active++
                timer = setInterval m.redraw, 100
            onremove: ->
              unless --active
                clearInterval timer
            Math.round (new Date() - @start) / 1000
            ' / '
            @count
      m 'tbody',
        for y in [0..3]
          m 'tr',
            for x in [0..3]
              m 'td', if cell = square[n++]
                  m 'button',
                    onclick: swap @, n-1
                    cell
                else
                  []
      m 'tfoot',
        m 'tr',
          m 'td',
            colspan: 4
            m 'button',
              onclick: =>
                @oninit()
              'Shuffle'

swap = (state, n)->
  ->
    square = state.square
    for i in [0..3]
      xy = [n>>2, n & 3]
      z = xy[i&1] += (i & 2) - 1
      if z >> 2
        continue
      if square[z = xy[0] << 2 | xy[1]]
        continue
      state.count++
      square[z] = square[n]
      square[n] = 0
      break
    return
