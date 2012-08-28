# encoding: UTF-8
require 'redcarpet/compat'

module ZenPush
  class Markdown

    # Convert a markdown file to HTML, removing all <code> tags,
    # which make Zendesk remove carriage returns.
    def self.to_zendesk_html(file)
      markdown_extensions = {
        :no_intra_emphasis => true, 
        :tables => true, 
        :fenced_code_blocks => true, 
        :autolink => true, 
        :strikethrough => true, 
        :lax_html_blocks => true, 
        :space_after_headers => true,
        :superscript => true
      }
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, markdown_extensions)
      markdown.render(File.read(file))
    end
  end
end
