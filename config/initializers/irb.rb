if $0 == 'irb'
  include Shrtnr

  ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
end
