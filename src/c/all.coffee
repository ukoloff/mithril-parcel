import m from 'mithril'

export default me =
  view: (vnode)->
    m 'ul',
      for k of list
        m '.',
          m 'a',
            href: "##{k}"
            k

import click from './click'
import greeting from './greeting'

export list =
  all: me
  hello: greeting
  click: click
