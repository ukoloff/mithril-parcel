import m from 'mithril'

import click from './c/click'
import greeting from './c/greeting'

m.route.prefix '#'
m.route document.body, 'hello',
  hello: greeting
  click: click
