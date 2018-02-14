###
List of components
###
import m from 'mithril'

import click from './click'
import greeting from './greeting'
import g15 from './15'

export default
  view: (vnode)->
    cells = @cells ||= [{c: click}, {c: greeting}, {c: g15}]
    @key ||= 0
    move = (i, delta)-> ->
      cells.splice i + delta, 0, cells.splice(i, 1)[0]
    dup = (i)-> ->
      cells.splice i+1, 0, c: cells[i].c
    drop = (i)-> ->
      cells.splice i, 1
    m '.boyan',
      for cell, i in cells
        m '.',
          key: cell.k ||= @key++
          m '.',
            m 'button',
              disabled: !i
              onclick: move i, -1
              'up'
            m 'button',
              disabled: i+1 == cells.length
              onclick: move i, +1
              'down'
            m 'button',
              onclick: dup i
              'dup'
            m 'button',
              onclick: drop i
              'drop'
          m cell.c
