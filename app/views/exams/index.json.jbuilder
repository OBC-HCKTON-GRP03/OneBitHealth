# frozen_string_literal: true

json.array! @exams, partial: 'exams/exam', as: :exam
