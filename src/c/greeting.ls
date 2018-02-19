m = require \mithril

module.exports =
  icon: \smile-o
  view: (vnode)->
    m \.text-center,
      m \label, 'Your name',
        m \br
        m \input.form-control,
          type: \text
          value: @value
          oncreate: (vnode)!->
            vnode.dom.focus!
          oninput: !->
            vnode.state.value = @value.trim!
      m \p, \Hello,
        ', ' if @value
        @value
        '!'
