class PagesController < ApplicationController
   before_action :authenticate_user!

   def new
     @record = Record.new
     @record.user = current_user
   end

   def show

   end
 end
