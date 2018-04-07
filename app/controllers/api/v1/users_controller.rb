# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        if params[:id] == 'current'
          @user = current_user
          return
        end
      end
    end
  end
end
