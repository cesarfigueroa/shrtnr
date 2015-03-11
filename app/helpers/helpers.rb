module Shrtnr
  module Helpers
    # def template(name, *args)
    #   directory = self.class.name.split('::').last.downcase
    #   erb File.join(directory, name.to_s).to_sym, *args
    # end
    #
    # # Refactor
    # def partial(name, *args)
    #
    #   if name.is_a? Symbol
    #     template(name.to_s.prepend('_'), *args)
    #   elsif name.is_a? String
    #     directory = name.split('/').reject(&:empty?)[0...-1].join('/')
    #     file_name = name.split('/').reject(&:empty?).last
    #
    #     erb File.join(directory, file_name.prepend('_')).to_sym, *args
    #   end
    # end

    def view_directory
      self.class.name.split('::').last.downcase
    end

    def find_template(views, name, engine, &block)
      super("#{views}/#{view_directory}", "_#{name}", engine, &block)
      super("#{views}/#{view_directory}", name, engine, &block)
      super(views, name, engine, &block)
    end

    def template(*args)
      render :erb, *args
    end

    alias_method :partial, :template
  end
end
