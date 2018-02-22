/*
List of components
*/
m = require \mithril

panels = <[info success warning]>

module.exports =
  icon: \wrench

  view: (vnode)->
    level = vnode.attrs.boyan-level || 0
    L = require '.'
    cells = @cells ||= [c: k for k of L]slice 0 Math.max 0 3 - level
    @key ||= 0
    used = {}
    move = (i, delta)-> !->
      cells.splice i + delta, 0 cells.splice(i, 1)[0]
    dup = (i)-> !->
      cells.splice i+1, 0 c: cells[i].c
    drop = (i)-> !->
      cells.splice i, 1
    append = (k)-> !->
      cells.push c: k
    unused = ->
      [k for k of L when not used[k]]

    m \.boyan,
      for cell, i in cells
        used[cell.c] = true
        m ".panel.panel-#{panels[level % panels.length]}",
          key: cell.k ||= @key++
          m \.panel-heading,
            m \button.btn.btn-sm.btn-success,
              disabled: !i
              onclick: move i, -1
              title: 'Move up'
              m \i.fa.fa-arrow-up
            m \button.btn.btn-sm.btn-success,
              disabled: i+1 == cells.length
              onclick: move i, +1
              title: 'Move down'
              m \i.fa.fa-arrow-down
            m 'button.btn.btn-sm.btn-info',
              onclick: dup i
              title: \Duplicate
              m \i.fa.fa-copy
            m \button.btn.btn-sm.btn-danger,
              onclick: drop i
              title: \Remove
              m \i.fa.fa-remove
          m \.panel-body,
            m L[cell.c].$,
              boyan-level: level + 1
      if (bottom = unused()).length
        m \.panel.panel-danger,
          key: '.'
          m \.panel-heading,
            for k in bottom
              m \button.btn.btn-sm.btn-success,
                onclick: append k
                m "i.fa.fa-#{L[k].$.icon}"
                ' '
                k
          m \.panel-body, 'Other components...'
