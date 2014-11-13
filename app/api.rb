module Acme
  class API < Grape::API
    prefix 'api'
    format :json
  end
end
