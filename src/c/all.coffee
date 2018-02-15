import m from 'mithril'

export default me =
  view: (vnode)->
    m 'ul',
      for k of list
        m '.',
          m 'a',
            oncreate: m.route.link
            href: k
            k

import click from './click'
import greeting from './greeting'
import g15 from './15'
import boyan from './boyan'
import fa from './fa'

export list =
  hello: greeting
  click: click
  fifteen: g15
  fa: fa
  boyan: boyan
  all: me

