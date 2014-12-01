module SimpleDatatable
  module ApplicationHelper
    def simple_datatable(id: nil, klass: '', url: '', cols: [])
      content_tag :table, id: id, class: klass + ' dataTable', 'data-url' => url do
        content_tag :thead do
          content_tag :tr do
            col_html = ""
            cols.each do |col|
              col.capitalize!
              col_html << content_tag(:th, col)
            end
            col_html.html_safe
          end
        end
      end.html_safe
    end
  end
end
