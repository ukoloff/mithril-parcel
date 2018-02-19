/*
Main layout & components list
*/
m = require \mithril

module.exports = routes =
  hello:    require \./greeting
  click:    require \./click
  fifteen:  require \./15.ls
  fa:       require \./fa.ls
  boyan:    require \./boyan.ls
  all:      require \./all

for let k, v of routes
  routes[k] =
    $: v
    onmatch: ->
      v
    render: (vnode)->
      m layout, vnode

layout =
  view: (vnode)->
    m \[,
      m \nav.navbar.navbar-inverse.navbar-static-top, m \.container-fluid, m \ul.nav.navbar-nav,
        m \a.navbar-brand,
          href: ''
          oncreate: m.route.link
          \Mithril
        for k, v of routes
          m \li, m \a,
            oncreate: m.route.link
            href: k
            m "i.fa.fa-#{v.$.icon}"
            ' '
            k
      m \.container-fluid,
        vnode.children
