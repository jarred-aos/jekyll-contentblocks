module Jekyll
  module Tags
    class ContentFor < Liquid::Block
      include ::Jekyll::ContentBlocks::ContentBlockTag
      alias_method :render_block, :render

      def render(context)

        rendered_block = render_block(context)
      
        content_for_block(context) << rendered_block
        context['page']['contentblocks'] ||= {}
        context['page']['contentblocks'][content_block_name] ||= []
        context['page']['contentblocks'][content_block_name] << { 'content' => converted_content(rendered_block, context)}

        ''
      end
    end
  end
end

