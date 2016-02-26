class PagesController < ApplicationController
  before_action :authenticate_user!, except:[:public_index]
  def index
  end

  def public_index
  end
end
