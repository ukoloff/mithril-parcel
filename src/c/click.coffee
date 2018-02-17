import m from 'mithril'

export default
  oninit: ->
    @count = 0

  view: (vnode)->
    m '.text-center',
      @count
      m 'br'
      m 'button.btn.btn-success',
        onclick: ->
          vnode.state.count++
        m 'i.fa.fa-plus-circle'
      m 'button.btn.btn-warning',
        onclick: ->
          vnode.state.count--
        m 'i.fa.fa-minus-circle'
