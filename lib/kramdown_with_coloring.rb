module Nanoc::Filters
  class KramdownWithColoring < Nanoc::Filter

    # Runs the content through [Kramdown](http://kramdown.rubyforge.org/).
    # Parameters passed to this filter will be passed on to Kramdown.
    #
    # @param [String] content The content to filter
    #
    # @return [String] The filtered content
    def run(content, params={})
      markdowned = Nanoc::Filters::Kramdown.new(@assigns).run(content, params)
      colored = Nanoc::Filters::ColorizeSyntax.new(@assigns).run(markdowned, params)
    end

  end
end

Nanoc::Filter.register '::Nanoc::Filters::KramdownWithColoring',        :kramdown_with_coloring
