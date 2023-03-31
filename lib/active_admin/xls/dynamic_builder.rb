require 'stringio'
require 'spreadsheet'

module ActiveAdmin
  module Xls
    # Builder for xls data.
    class DynamicBuilder
      def initialize(resource_class, options = {}, &block)
        @resource_class = resource_class
        @options = options
        @block = block
      end
      
      def serialize(collection, view_context, params)
        builder = ActiveAdmin::Xls::Builder.new(
          @resource_class,
          @options,
          params,
          &@block
        )
        
        builder.serialize(collection, view_context)
      end
    end
  end
end
