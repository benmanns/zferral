require File.join(File.dirname(__FILE__), '..', 'resource')

module Zferral
  # A Zferral Coupon resource, that behaves like a RESTful Resource
  #
  # http://zferral.com/api-docs/coupon
  class Coupon < Resource
    def self.get_by_code code
      response = get("/coupon/getByCode/#{code}.json").parsed_response
      handle_fetch response
    end
  end
end
