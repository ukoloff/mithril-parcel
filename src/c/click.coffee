import m from 'mithril'

export default
  oninit: ->
    @count = 0

  view: (vnode)->
    m '.text-center',
      m 'span.label',
        class: "label-#{if @count then if @count > 0 then "info" else "danger" else "default"}"
        @count
      m 'p'
      m 'button.btn.btn-success',
        onclick: ->
          vnode.state.count++
        m 'i.fa.fa-plus-circle'
      m 'button.btn.btn-warning',
        onclick: ->
          vnode.state.count--
        m 'i.fa.fa-minus-circle'
