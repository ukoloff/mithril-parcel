import m from 'mithril'

import layout from './layout'

export default
  view: (vnode)->
    m '.list-group',
      for k of layout()
        m 'a.list-group-item',
          oncreate: m.route.link
          href: k
          k
