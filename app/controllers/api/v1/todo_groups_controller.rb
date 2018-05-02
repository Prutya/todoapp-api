# frozen_string_literal: true

module Api
  module V1
    class TodoGroupsController < ApplicationController
      before_action :fetch_resource!, only: %i[show update destroy]
      before_action :fetch_resources!, only: %i[index]

      def index
      end

      def show
      end

      def create
        @todo_group = current_user.todo_groups.create!(params_create)
      end

      def update
        @todo_group.update_attributes!(params_update)
      end

      def destroy
        @todo_group.destroy!
      end

      private

      def fetch_resource!
        @todo_group = current_user.todo_groups
          .find(params[:id].to_i)
      end

      def fetch_resources!
        @todo_groups = current_user.todo_groups
          .order(created_at: :desc)
          .page(page).per(per_page)
      end

      def params_create
        params.require(:todoGroup).permit(:title)
      end

      def params_update
        params.require(:todoGroup).permit(:title)
      end
    end
  end
end
