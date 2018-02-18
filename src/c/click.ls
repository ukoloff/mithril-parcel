m = require \mithril

module.exports =
  icon: \sliders

  oninit: !->
    @count = 0

  view: (vnode)->
    m \.text-center,
      m "span.label.label-#{className @count}", @count
      m \p
      m \button.btn.btn-success,
        onclick: !->
          vnode.state.count++
        m \i.fa.fa-plus-circle
      m \button.btn.btn-warning,
        onclick: !->
          vnode.state.count--
        m \i.fa.fa-minus-circle

function className
  if it
    if it > 0
      \info
    else
      \danger
  else
    \default
