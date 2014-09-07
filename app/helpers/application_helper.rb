module ApplicationHelper
  def elements_options_for_select(collection, selected=nil, method=:name)
    s = ''
    collection.sort.each do |element|
      selected_attribute = ' selected="selected"' if option_value_selected?(element, selected) || element.id.to_s == selected
      s << %(<option value="#{element.id}"#{selected_attribute}>#{h element.send(method)}</option>)
    end
    s.html_safe
  end
end
