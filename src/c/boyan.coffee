###
List of components
###
import m from 'mithril'

export default
  view: (vnode)->
    cells = @cells ||= []
    m '.boyan',
      for cell in cells
        m '.'
