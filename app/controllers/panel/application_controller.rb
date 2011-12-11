# coding: utf-8  
class Panel::ApplicationController < ApplicationController
  layout "application"
  before_filter :require_user
end
