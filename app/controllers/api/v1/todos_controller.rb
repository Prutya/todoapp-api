# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :fetch_resources!, only: %i[index]
      before_action :fetch_resource!,  only: %i[update destroy]

      def index
      end

      def create
        @todo = Todo.new(params_create)
        @todo.save!
      end

      def update
        @todo.completed_at = params_update[:completed] ? Time.now : nil
        @todo.save!
      end

      def destroy
        @todo.destroy!
      end

      private

      def fetch_resources!
        @todos = Todo.page(page).per(per_page)
      end

      def fetch_resource!
        @todo = Todo.find(params[:id]&.to_i)
      end

      def params_create
        params.require(:todo).permit(:title)
      end

      def params_update
        params.require(:todo).permit(:completed)
      end
    end
  end
end
