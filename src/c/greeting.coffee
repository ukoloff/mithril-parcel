import m from 'mithril'

export default
  view: (vnode)->
    m '[',
      m 'label',
        'Your name',
        m 'br'
        m 'input',
          value: @value,
          oncreate: (vnode)->
            vnode.dom.focus()
          oninput: ->
            vnode.state.value = @value.trim()
      m 'p', 'Hello',
        ', ' if @value
        @value
        '!'
