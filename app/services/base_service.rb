class BaseService
  include ServiceResultMethods

  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def self.perform(*args)
    new(*args).perform
  end

  def perform
    throw 'Must Be Implemented In Child Class'
  end
end