module SimpleDatatable
  module ApplicationHelper
    def simple_datatable(cols = [], html_options = {})
      html_options[:class] ||= ''
      html_options[:class] << 'dataTable'
      content_tag :table, html_options do
        content_tag :thead do
          content_tag :tr do
            cols.each_with_object('') do |col, html|
              html << content_tag(:th, col.capitalize)
            end.html_safe
          end
        end
      end.html_safe
    end
  end
end
