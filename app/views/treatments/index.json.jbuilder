# frozen_string_literal: true

json.array! @treatments, partial: 'treatments/treatment', as: :treatment
