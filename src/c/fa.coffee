###
List Font Awesome icons
###
import m from 'mithril'

names = do ->
  re = /\.fa-(.+?):+before/g
  result = []
  for list in document.styleSheets
    for rule in list.rules or list.cssRules
      if /^\.fa-.*:before\b.*\bcontent:/.test s = rule.cssText
        while match = re.exec s
          result.push match[1]
  result.sort()

export default
  view: (vnode)->
    m '.fontAwesome',
      for icon in names
        m 'span',
          m "i.fa.fa-#{icon}"
          icon
