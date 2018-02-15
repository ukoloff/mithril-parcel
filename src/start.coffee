import m from 'mithril'

import layout from './c/layout'

m.route.prefix '#'
m.route document.body, 'hello', layout()
