import m from 'mithril'

import click from './click'
import greeting from './greeting'
import g15 from './15'
import boyan from './boyan'
import fa from './fa'
import all from './all'

memoize = 0

export default routes = ->
  memoize ||= wrap
    hello: greeting
    click: click
    fifteen: g15
    fa: fa
    boyan: boyan
    all: all

wrap = (rec)->
  for k, v of rec
    rec[k] = do (v)->
      $: v
      onmatch: ->
        v
      render: (vnode)->
        m layout, vnode
  rec

layout =
  view: (vnode)->
    m '[',
      m 'nav.navbar.navbar-inverse.navbar-static-top', m '.container-fluid', m 'ul.nav.navbar-nav',
        m 'a.navbar-brand',
          href: ''
          oncreate: m.route.link
          'Mithril'
        for k, v of routes()
          m 'li', m 'a',
            oncreate: m.route.link
            href: k
            m "i.fa.fa-#{v.$.icon}"
            ' '
            k
      m '.container-fluid',
        vnode.children

require './test'

