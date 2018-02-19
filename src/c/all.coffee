import m from 'mithril'

export default
  icon: 'list'
  view: (vnode)->
    m '.list-group',
      for k, v of do require './layout'
        m 'a.list-group-item',
          oncreate: m.route.link
          href: k
          m "i.fa.fa-#{v.$.icon}"
          ' '
          k
