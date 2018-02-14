import m from 'mithril'

export default
  oninit: ->
    @count = 0

  view: (vnode)->
    m '.',
      @count
      m 'br'
      m 'button',
        onclick: ->
          vnode.state.count++
        '++'
      m 'button',
        onclick: ->
          vnode.state.count--
        '--'
