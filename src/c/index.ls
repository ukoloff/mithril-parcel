/*
Main layout & components list
*/
m = require \mithril

module.exports = routes

var memoize

function routes
  memoize ||:= wrap do
    hello:    require \./greeting
    click:    require \./click
    fifteen:  require \./15.ls
    fa:       require \./fa
    boyan:    require \./boyan
    all:      require \./all

function wrap
  for let k, v of it
    it[k] =
      $: v
      onmatch: ->
        v
      render: (vnode)->
        m layout, vnode
  it

layout =
  view: (vnode)->
    m \[,
      m \nav.navbar.navbar-inverse.navbar-static-top, m \.container-fluid, m \ul.nav.navbar-nav,
        m \a.navbar-brand,
          href: ''
          oncreate: m.route.link
          \Mithril
        for k, v of routes()
          m \li, m \a,
            oncreate: m.route.link
            href: k
            m "i.fa.fa-#{v.$.icon}"
            ' '
            k
      m \.container-fluid,
        vnode.children
