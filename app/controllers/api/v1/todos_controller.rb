# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :fetch_parent_resource!, only: %i[index create]
      before_action :fetch_resources!,       only: %i[index]
      before_action :fetch_resource!,        only: %i[update destroy]

      def index
      end

      def create
        @todo = @todos_group.todos.create!(params_create)
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

        @todos = @todo_group.todos
          .send(scope)
          .order(created_at: :desc)
          .page(page).per(per_page)
      end

      def fetch_parent_resource!
        @todo_group = TodoGroup.find(params[:todo_group_id]&.to_i)
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
