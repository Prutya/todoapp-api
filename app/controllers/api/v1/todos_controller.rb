# frozen_string_literal: true

module Api
  module V1
    class TodosController < ApplicationController
      before_action :fetch_parent_resource!, only: %i[index create]
      before_action :fetch_resources!,       only: %i[index]
      before_action :fetch_resource!,        only: %i[destroy update show]

      def index
      end

      def show
      end

      def create
        @todo = @todo_group.todos.create!(params_create)
      end

      def update
        @todo.update_attributes!(params_update)
      end

      def destroy
        @todo.destroy!
      end

      private

      def fetch_resource!
        @todo = Todo.joins(:todo_group)
          .where('todo_groups.user_id = ?', current_user.id)
          .find(params[:id]&.to_i)
      end

      def fetch_resources!
        @todos = @todo_group.todos
          .send(scope_filter)
          .order(created_at: :desc)
          .page(page).per(per_page)
      end

      def fetch_parent_resource!
        @todo_group = current_user.todo_groups.find(params[:todo_group_id]&.to_i)
      end

      def scope_filter
        case params[:filter]
        when 'active'
          :active
        when 'completed'
          :completed
        else
          :all
        end
      end

      def params_create
        params.require(:todo).permit(:title)
      end

      def params_update
        new_params = params.require(:todo).permit(:title, :completed).to_h

        return new_params if new_params[:completed].nil?

        new_params[:completed_at] = new_params[:completed] ? Time.now : nil
        new_params.reject { |key, _| key == 'completed' }
      end
    end
  end
end
