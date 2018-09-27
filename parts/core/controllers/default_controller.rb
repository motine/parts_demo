class DefaultController < ApplicationController
  def index
    @organizations = Organization.all
  end
end
