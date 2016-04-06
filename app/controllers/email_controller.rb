class EmailController < ApplicationController

  require 'securerandom'

  def verify ( provider_id = 1)
    random_string = SecureRandom.hex
    p random_string.inspect

  end
end
