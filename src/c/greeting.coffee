import m from 'mithril'

export default
  view: (vnode)->
    m '[',
      m 'label',
        'Name',
        m 'br'
        m 'input',
          value: @value,
          oninput: ->
             vnode.state.value = @value.trim()
      m 'p', 'Hello, ', @value, '!'
