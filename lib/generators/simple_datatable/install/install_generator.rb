module SimpleDatatable

  # Public: install assets for simple_datatable
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    CSS_PATH = "#{Rails.root}/app/assets/stylesheets/application.css"
    JS_PATH = "#{Rails.root}/app/assets/javascripts/application.js"
    HELPER_PATH = "#{Rails.root}/app/helpers/application_helper.rb"

    def has_use_bootstrap
      @use_bootstrap = yes? 'Would you like to add Bootstrap 3 stylesheet?'
    end

    def add_datatable_bootstrap_stylesheets
      return unless @use_bootstrap

      inject_into_file CSS_PATH, before: " */" do
        <<-'RUBY'.strip_heredoc.insert(0, ' ')
          *= require simple_datatable/bootstrap
          *= require simple_datatable/dataTables.bootstrap
        RUBY
      end
    end

    def add_datatable_javascripts
      append_to_file JS_PATH do
        <<-'RUBY'.strip_heredoc
          //= require simple_datatable/jquery.dataTables.min
        RUBY
      end
    end

    def add_datatable_bootstrap_javascripts
      return unless @use_bootstrap

      append_to_file JS_PATH do
        <<-'RUBY'.strip_heredoc
          //= require simple_datatable/dataTables.bootstrap
        RUBY
      end
    end

    def add_helper
      inject_into_file HELPER_PATH, after: "module ApplicationHelper\n" do
        <<-'RUBY'
  include SimpleDatatable::ApplicationHelper
        RUBY
      end
    end

    def init_datatable
      append_to_file JS_PATH do
        <<-'RUBY'

jQuery(document).ready(function(){
  $('.dataTable').dataTable();
});
        RUBY
      end
    end
  end
end
