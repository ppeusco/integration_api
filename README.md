
# Configuración:
> git clone https://github.com/ppeusco/integration_api.git
> git checkout master
> cp .env.example .env
> bundle install

### PostgreSQL
Para la base de datos, si tienes PostgreSQL instalada y corriendo localmente:
> rails db:setup # rails db:create db:migrate

Si no lo tienes puedes utilizar docker, haciendo:
> docker-compose up -d
> rails db:environment:set RAILS_ENV=development
> rails db:setup # rails db:create db:migrate

### Sidekiq:
> bundle exec sidekiq -C config/sidekiq.yml

### Para correr Integration API:
> bundle exec rails s

### Para correr los test:
> bundle exec rspec       
