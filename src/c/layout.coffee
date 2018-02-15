import m from 'mithril'

import {list} from './all'

export default routes = {}

layout =
  view: (vnode)->
    m '[',
      m 'nav',
        for k of list
          m 'a',
            oncreate: m.route.link
            href: k
            k
      vnode.children...

wrap = (component)->
  onmatch: ->
    component
  render: (vnode)->
    m layout, vnode

for k, v of list
  routes[k] = wrap v
