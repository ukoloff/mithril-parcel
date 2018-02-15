###
List of components
###
import m from 'mithril'

import layout from './layout'

export default
  view: (vnode)->
    L = layout()
    console.log L
    cells = @cells ||= (c: k for k of L).slice 0, 3
    console.log 'C', cells
    @key ||= 0
    used = {}
    move = (i, delta)-> ->
      cells.splice i + delta, 0, cells.splice(i, 1)[0]
    dup = (i)-> ->
      cells.splice i+1, 0, c: cells[i].c
    drop = (i)-> ->
      cells.splice i, 1
    unused = ->
      k for k of L when not used[k]
    append = (k)-> ->
      cells.push c: k

    m '.boyan',
      for cell, i in cells
        used[cell.c] = true
        m '.',
          key: cell.k ||= @key++
          m '.',
            m 'button',
              disabled: !i
              onclick: move i, -1
              title: 'Move up'
              m 'i.fa.fa-arrow-up'
            m 'button',
              disabled: i+1 == cells.length
              onclick: move i, +1
              title: 'Move down'
              m 'i.fa.fa-arrow-down'
            m 'button',
              onclick: dup i
              title: 'Duplicate'
              m 'i.fa.fa-copy'
            m 'button',
              onclick: drop i
              title: 'Remove'
              m 'i.fa.fa-remove'
          m L[cell.c].$
      if (bottom = unused()).length
        m '.',
          m '.',
            for k in bottom
              m 'button',
                onclick: append k
                k
          'Other components...'
