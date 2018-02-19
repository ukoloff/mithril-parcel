/*
Game of 15
*/
m = require \mithril

function shuffle
  i = it.length
  while i > 0
    x = it[j = Math.floor Math.random! * i--]
    it[j] = it[i]
    it[i] = x
  it

active = timer = 0

module.exports =
  icon: \gamepad

  oninit: !->
    @ <<<
      start: new Date
      count: 0
      square: shuffle [i for i to 15]

  view: (vnode)->
    square = @square
    n = 0
    m \table.x15,
      m \thead, m \tr, m \th,
        colspan: 4
        oncreate: !->
          unless active++
            timer := setInterval m.redraw, 100 * (1 + Math.random!)
        onremove: !->
          unless --active
            clearInterval timer
        Math.round (new Date! - @start) / 1000
        ' / '
        @count
      m \tbody,
        for y to 3
          m \tr,
            for x to 3
              m \td, if cell = square[n++]
                m \button.btn.btn-info,
                  onclick: swap @, n-1
                  cell
              else
                []
      m \tfoot, m \tr, m \td,
        colspan: 4
        m \button.btn.btn-danger.btn-xs,
          onclick: !~>
            @oninit!
          'Shuffle'

function swap(state, n)
  !->
    square = state.square
    for i to 3
      xy = [n .>>. 2, n .&. 3]
      z = xy[i .&. 1] += (i .&. 2) - 1
      if z .>>. 2
        continue
      if square[z = xy[0] .<<. 2 .|. xy[1]]
        continue
      state.count++
      square[z] = square[n]
      square[n] = 0
      break
