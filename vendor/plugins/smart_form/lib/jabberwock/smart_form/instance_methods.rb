module Jabberwock # :nodoc:
  module SmartForm # :nodoc:
    # Instance methods which get included into ActionView::Base
    module InstanceMethods
      #
      # If you notice this and want it implemented, let me know.
      #
      # An optional sample container to envelope +smart_form_for+ in.
      # Renders a block using a partial.
      #
      # ==Usage:
      #   <% smart_form_container "some title" do %>
      #     <section>
      #       <%= smart_form_for :blah, options %>
      #     </section>
      #     <br />
      #   <% end %>
      #def smart_form_container(title, options = {}, &block)
      #  options.merge!(:title => title, :body => capture(&block))
      #  options[:body].gsub!("<section>","<div class=\"section\">")
      #  options[:body].gsub!("</section>","</div>")
      #  concat(render(:partial => 'shared/smart_form_container', :locals => options), block.binding)
      #end
      
      # Generates form fields for a model - including it's content columns, and all association reflections.
      # The form fields are encapsulated in an HTML definition list.
      #
      # For an example style-sheet, you may use:
      #   <tt>ruby ./script/generate SmartFormStyles</tt>
      #
      # =Note:
      # +smart_form_for+ generates only the +form+ fields and not the starting/ending +form+ tags. 
      #
      # ==Usage:
      # smart_form_for(symbol, options)
      #
      # ==Examples:
      #   <% form_for "/people", :method => :post do %>
      #     <%= smart_form_for :person %>
      #   <% end %>
      # 
      # ==Other Examples:
      #   <%= smart_form_for :person, :exclude => 'created_at' %>
      #   <%= smart_form_for :person, :exclude => ['created_at', 'updated_at'], :class => 'my_list', :style => 'border:1px solid white;', :id => 'my_list' %>
      #
      # ==Options
      # * <tt>symbol</tt>              -- A symbol of a model instance variable for which the form fields will be generated. 
      # * <tt>:object</tt>             -- Takes an instance variable (ie; used to load form defaults for editing)
      # * <tt>:order</tt>              -- Display order; an array of column or reflectin names.
      # * <tt>:habtm_select_values</tt>-- A hash in which each key is a habtm reflection name and the value is the foreign column to use for
      #                                   the select/multiple option values. By default, the first column of type +text+ or +varchar+ is used.
      # * <tt>:exclude</tt>            -- A +String+, or an +Array+ of column names (or associatin reflection(s)) to exclude from the form.
      # * <tt>:include</tt>            -- A +String+, or an +Array+ of column names which would not otherwise be included in the model's +content_columns+. 
      #                                   For example, an 'orders' table  might contain a 'transaction_id' column which refers to an Authorize.NET 
      #                                   transaction ID, and not a foreign key to a 'transactions' table. Because this column ends with "_id", it 
      #                                   will not be in the models content columns. Use this option to display form fields for these types of columns. 
      # * <tt>:class</tt>              -- The +class+ attribute for the +DL+ element (defaults to "+smart_form+").
      # * <tt>:text_field</tt>         -- HTML options for text +input+ fields.
      # * <tt>:number_text_field</tt>  -- HTML options for text +input+ fields that deal with numbers (ie: decimal, float, integer)
      # * <tt>:text_area</tt>          -- HTML options for +textarea+ elements
      # * <tt>:select</tt>             -- Options for +select+ (default: :include_blank => true). Also contains a nested :html hash of HTML options to pass.
      # * <tt>:date_select</tt>        -- HTML options for +date_select+ 
      # * <tt>:datetime_select</tt>    -- HTML options for +datetime_select+ 
      # * <tt>:time_select</tt>        -- HTML options for +time_select+ 
      # * <tt>:mselect</tt>            -- HTML options for +select multiple="multiple"+ boxes
      # * <tt>:mselect_footnote</tt>   -- A footnote which appears below select/multiples (default: "(crtl+click to select multiple)")
      # * <tt>:left_width</tt>         -- The width of the left column in pixels. If specified, this setting will override the style-sheet
      # * <tt>:right_width</tt>        -- The width of the right column in pixels. If specified, this setting will override the style-sheet
      def smart_form_for(obj, options = {})
        @sf_options           = DEFAULT_FORM_OPTIONS.merge(options)
        @sf_options[:exclude] = [@sf_options[:exclude]] unless @sf_options[:exclude].is_a?(Array)
        @sf_exclude           = @sf_options[:exclude] + DEFAULT_FORM_OPTIONS[:exclude] # always exclude the default excludes, by default :)
        @sf_options[:include] = [@sf_options[:include]] unless @sf_options[:include].is_a?(Array)
        @sf_include           = @sf_options[:include]
        @left_style           = (@sf_options[:left_width].to_i  == 0 ? "" : " style=\"width: #{options[:left_width]}px !Important;\"")
        @right_style          = (@sf_options[:right_width].to_i == 0 ? "" : " style=\"width: #{options[:right_width]}px !Important;\"")
        @sf_options[:order]   = [@sf_options[:order]] unless @sf_options[:order].is_a?(Array)
        @sf_sections          = {}

        raise ArgumentError, "The first argument to smart_form must be a symbol" unless obj.is_a?(Symbol)
        
        # make sure the following arrays have each element converted to a string for
        # further use:
        @sf_exclude.map!(&:to_s)
        @sf_include.map!(&:to_s)
        @sf_options[:order].map!(&:to_s)

        # Get the ActiveRecord object of the symbol being passed
        @ar_object = get_class(obj)    

        @sf_display_order = default_display_order(@ar_object)
        @sf_display_order.reject!{|name| @sf_exclude.include?(name)}

        # This will be loaded with the HTML to output as we go:
        @sf_html = "" 
   
        @sf_display_order.each do |row|
          if @ar_object.reflections[row.to_sym]
            @sf_html << row_for_reflection(obj, @ar_object.reflections[row.to_sym], options)
          else
            @sf_html << row_for_column(obj, @ar_object.columns.find{|c| c.name==row})
          end
          @sf_html << "\n<!-- break --><div class=\"sf_break\"></div>\n" # get out of float madness
        end
        
        @sf_html
      end # smart_form_for


      private
      # Retrieve the ActiveRecord class of a model from a symbol
      def get_class(obj)
        tmp_obj = obj.to_s      # symbol to string
        tmp_obj.gsub!('_',' ')  # replace under scores with spaces
        tmp_obj = tmp_obj.split # split on the spaces
        tmp_obj.each {|w|       # capiatlize each word
          w.capitalize!
        }
        Object.const_get(tmp_obj.join) # finally, obtain the constant and return it
      end

      # Ouputs +DL+ row for a column
      def row_for_column(obj, col)
        html = "<dl class=\"#{@sf_options[:class]}\">\n"

        # make sure the HTML label is correct for a datetime or timestamp column:
        if col.type.to_s =~ /(datetime|date|timestamp|time)/
          html << "  <dt#{@left_style}><label for=\"#{obj}_#{col.name}_1i\">#{col.name.gsub('_',' ').camelize}:</label></dt>\n"
        else
          html << "  <dt#{@left_style}><label for=\"#{obj}_#{col.name}\">#{col.name.gsub('_',' ').camelize}:</label></dt>\n"
        end

        html << "  <dd#{@right_style}>\n"

        case col.type
          when :text
            html << text_area(obj, col.name.to_sym, @sf_options[:text_area])
          when :string
            html << text_field(obj, col.name.to_sym, @sf_options[:text_field])
          when :boolean
            html << select(obj, col.name.to_sym, [[' Yes ',true], [' No ',false]], @sf_options[:select].reject{|k,v|k==:html}, @sf_options[:select][:html])
          when :integer, :decimal, :float
            html << text_field(obj, col.name.to_sym, @sf_options[:number_text_field])
          when :date
            html << date_select(obj, col.name.to_sym, @sf_options[:date_select])
          when :datetime
            html << datetime_select(obj, col.name.to_sym, @sf_options[:datetime_select])
          when :time
            html << time_select(obj, col.name.to_sym, @sf_options[:time_select])
          when :timestamp
          html << datetime_select(obj, col.name.to_sym, @sf_options[:datetime_select])
        else
          raise UnknownColumnType, "SmartForm does not know how to handle #{col.type}! Please inform the author: #{$sf_author}"
        end # case

        html << "  </dd>\n"
        html << "</dl>\n"
        html
      end # row_for_column

      # Outputs a +DL+ row for a model's reflection
      def row_for_reflection(obj, vhash, options)
          html = "<dl class=\"#{@sf_options[:class]}\">\n"

          # get class name of the target reflection model:
          target_class = Object.const_get(vhash.class_name)

          # guess the text/varchar column to display in select/multi boxes:
          # (or use a column that the user supplied)
          target_column = target_class.guess_column_for_option_value(@sf_options[:habtm_select_values][vhash.name.to_sym])
        
          # has_many :through
          # create the values for the name and id attributes of the select tag:
          if vhash.options[:through]
            name_attr   = "#{obj}[#{vhash.options[:through].to_s.downcase.singularize}_ids][]"
            id_attr     = vhash.options[:through].to_s.singularize + "_ids"
          else
            name_attr = "#{obj}[#{vhash.name.to_s.downcase.singularize}_ids][]"
            id_attr   = "#{obj}_#{vhash.name.to_s.downcase.singularize}_ids"
          end

          # has_many :through and has_and_belongs_to_many:
          if ((vhash.macro == :has_and_belongs_to_many) or (vhash.macro == :has_many and vhash.options[:through]))
            html << "  <dt#{@left_style}><label for=\"#{id_attr}\">#{vhash.name.to_s.gsub('_',' ').camelize}:</label></dt>\n"
            html << "  <dd#{@right_style}>\n"

            # we'll pull any existing assocation records for the current
            # reflection to auto-populate the select/multiple box:
            if options[:object]
              #if vhash.options[:through] # has_many :through
              #  selected = [options[:object].send(name_attr)] 
              #else # has_and_belongs_to_many
                selected = options[:object].send("#{vhash.name}").collect{|c| c.id}
              #end
            else
              selected = []
            end

            html << "    <select name=\"#{name_attr}\" id=\"#{id_attr}\" multiple=\"multiple\" size=\"#{@sf_options[:mselect_size]}\">\n"
            html << options_from_collection_for_select(target_class.find(:all,
                                                                         :order => "#{target_column}"),
                                                                         :id,
                                                                         target_column.to_sym,
                                                                         selected)
            html << "    </select>\n"
            html << "    <br /><small>#{@sf_options[:mselect_footnote]}</small><br />\n"
            html << "  </dd>\n"
          # belongs_to
          elsif vhash.macro==:belongs_to
            html << "  <dt#{@left_style}><label for=\"#{obj}_#{vhash.name.to_s.downcase}_id\">#{vhash.name.to_s.gsub('_',' ').camelize}:</label></dt>\n"
            html << "  <dd#{@right_style}>\n"
            html << "    " +  select(obj, "#{vhash.name.to_s.downcase}_id".to_sym, target_class.find(:all).collect{|t| [t.send(target_column), t.id]},@sf_options[:select].reject{|k,v|k==:html}, @sf_options[:select][:html]) + "\n"
            html << "  </dd>\n"
          else
          end # end if vhash.macro

          html << "</dl>\n"
          html
      end # row_for_reflection 

      # set and return the default display order for the for.
      # This will be the same order as 'describe table' in MySQL or \d table in PostgreSQL,
      # followed by the reflections.
      def default_display_order(obj)
        # get reflection names, ignoring has_many and has_one relationships (but accept has_many :through):
        refnames = obj.reflections.collect{|key,val| key.to_s unless ( (val.macro==:has_one) || (val.macro==:has_many and !val.options[:through]) )}.compact 
        # get cotent columns plus whatever may be in options[:include]
        contcols = obj.content_columns.map(&:name) + @sf_include # get content (non-reflective) column names
        
        entities = (contcols + refnames)
        
        if !@sf_options[:order].empty?
          (@sf_options[:order].to_a + entities.reject!{|e| @sf_options[:order].include?(e)})
        else
          entities
        end 
      end # default_display_order
    
    end # InstanceMethods
  end # SmartForm
end # Jabberwock

