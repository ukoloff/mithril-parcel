import m from 'mithril'

import layout from './layout'

export default
  view: (vnode)->
    m 'ul',
      for k of layout()
        m '.',
          m 'a',
            oncreate: m.route.link
            href: k
            k
