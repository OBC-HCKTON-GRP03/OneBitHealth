namespace :dev do
  DEFAULT_PASWORD = '123456'.freeze
  desc 'Configurações básicas para o desenvolvimento da aplicação!'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { `rails db:drop` }
      show_spinner('Criando BD...') { `rails db:create` }
      show_spinner('Migrando BD...') { `rails db:migrate` }
      show_spinner('Cadastrando o administrador padrão...') { `rails dev:add_default_admin` }
      show_spinner('Cadastrando os usuários padrões...') { `rails dev:add_defaul_users` }
      show_spinner('Cadastrando as consultas para os usuários...') { `rails dev:add_appointments_to_user` }
      show_spinner('Cadastrando os exames para as consultas...') { `rails dev:add_exams_to_appointment` }
      show_spinner('Cadastrando os tratamentos para as consultas...') { `rails dev:add_treatments_to_appointment` }
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  task add_default_admin: :environment do
    User
      .create!(name: 'Admin',
               email: 'admin@admin.com',
               password: DEFAULT_PASWORD,
               password_confirmation: DEFAULT_PASWORD)
  end

  task add_defaul_users: :environment do
    9.times do |_x|
      name = Faker::Name.name
      User
        .create!(name: name,
                 email: Faker::Internet.email(name: (I18n.transliterate name)),
                 password: DEFAULT_PASWORD,
                 password_confirmation: DEFAULT_PASWORD)
    end
  end

  task add_appointments_to_user: :environment do
    User.all.each do |user|
      rand(1..4).times do |appointment|
        Appointment
          .create!(
            title: "Consulta #{appointment + 1}: #{user.name}",
            description: 'Teste',
            professional_name: Faker::Name.name,
            appointment_date: Time.now.to_date,
            user_id: user.id
          )
      end
    end
  end

  task add_exams_to_appointment: :environment do
    Appointment.all.each do |appointment|
      rand(1..3).times do |exam|
        Exam
          .create!(
            title: "Exame #{exam + 1}: #{appointment.user.name}",
            description: 'Teste',
            establishment_name: Faker::Address.full_address,
            exam_date: fictitious_date,
            appointment_id: appointment.id
          )
      end
    end
  end

  task add_treatments_to_appointment: :environment do
    Appointment.all.each do |appointment|
      rand(1..3).times do |treatment|
        Treatment
          .create!(
            title: "Treatment #{treatment + 1}: #{appointment.user.name}",
            description: 'Teste',
            establishment_name: Faker::Address.full_address,
            kind: rand(0..1),
            treatment_date: fictitious_date,
            appointment_id: appointment.id
          )
      end
    end
  end

  private

  def fictitious_date
    Time.now.to_date - rand(1..180)
  end

  def show_spinner(msg_start, msg_end = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  def format_name
    gsub!(/( )/, '_').downcase!
  end
end
