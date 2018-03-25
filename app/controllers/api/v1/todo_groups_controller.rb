# frozen_string_literal: true

module Api
  module V1
    class TodoGroupsController < ApplicationController
      before_action :fetch_resources!, only: %i[index]

      def index
      end

      private

      def fetch_resources!
        @todo_groups = TodoGroup
          .order(created_at: :desc)
          .page(page).per(per_page)
      end
    end
  end
end
