import m from 'mithril'

import {list} from './c/all'

m.route.prefix '#'
m.route document.body, 'all', list
