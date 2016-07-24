module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction == "asc" ? "asc dropup" : "desc"}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to({sort: column, direction: direction}, {class: css_class}) do
      content_tag(:span, title) +
      content_tag(:span, nil, class: "caret")
    end
  end
end
