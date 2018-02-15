###
List Font Awesome icons
###
import m from 'mithril'

names = do ->
  re = /\.fa-(.+?):+before/g
  result = []
  try for list in document.styleSheets
    for rule in list.rules or list.cssRules
      if /^\.fa-.*:before\b.*\bcontent:/.test s = rule.cssText
        while match = re.exec s
          result.push match[1]
  result.sort()

export default
  view: (vnode)->
    state = @
    state.w ||= 1
    guid = state.guid ||= /\d{2,}/.exec(Math.random())[0] or +new Date
    filter = (state.filter || '').toLowerCase()
    m '.fontAwesome',
      m 'label', 'Filter ',
        m 'input',
          value: state.filter
          oninput: ->
            state.filter = @value.toLowerCase()
      m ".all.x#{guid}",
        oncreate: (vnode)->
          max = Math.max (span.offsetWidth for span in vnode.dom.children)...
          state.w = max / vnode.dom.children[0].offsetWidth
          setTimeout m.redraw
        m '.'
        for icon in names when !filter or 0 <= icon.indexOf filter
          start = icon.slice 0, 18
          if start.length > icon.length - 3
            start = icon
          long = start.length < icon.length
          m 'span',
            key: icon
            title: icon if long
            m "i.fa.fa-#{icon}"
            start
            m.trust '&hellip;' if long
      m 'style', ".x#{guid} span{min-width:#{state.w.toFixed 1}em}"
