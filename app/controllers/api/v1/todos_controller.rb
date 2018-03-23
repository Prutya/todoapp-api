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
        @todo.completed_at = @todo.completed_at ? nil : Time.now
        @todo.save!
      end

      def destroy
        @todo.destroy!
      end

      private

      def fetch_resources!
        scope = case params[:filter]
        when 'active'
          :active
        when 'completed'
          :completed
        else
          :all
        end

        @todos = Todo.send(scope).page(page).per(per_page)
      end

      def fetch_resource!
        @todo = Todo.find(params[:id]&.to_i)
      end

      def params_create
        params.require(:todo).permit(:title)
      end
    end
  end
end
