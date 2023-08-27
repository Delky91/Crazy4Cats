# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Usuario Administrador
User.create!(
  email: 'admin@email.com',
  password: '123456',
  password_confirmation: '123456',
  role: 'admin'
)

# Crear un usuario genérico para comentarios anónimos
User.create!(
  email: 'anonimo@example.com',
  password: 'password', # O cualquier contraseña que desees
  role: 'anonimo'
)

Post.create!(
  title: 'Curiosidades sobre los gatos',
  user: User.first,
  content: 'Los gatos son criaturas fascinantes con una larga historia de convivencia con los humanos. Aquí hay algunas curiosidades interesantes sobre los gatos:

1. Los gatos tienen un sentido del olfato increíblemente agudo, ¡14 veces más poderoso que el de los humanos!

2. Los gatos domésticos pueden alcanzar velocidades de hasta 30 mph (48 km/h) en carreras cortas.

3. Los gatos tienen una estructura ósea flexible, lo que les permite caber en espacios increíblemente estrechos.

4. Aunque los gatos son conocidos por ser cazadores, en realidad muchos gatos prefieren la compañía humana y son excelentes mascotas.

5. Los gatos tienen glándulas especiales en sus mejillas que usan para marcar su territorio frotándose en objetos y personas. Se cree que esto es una forma de mostrar afecto y posesión.

¡Los gatos son realmente criaturas asombrosas que han capturado los corazones de muchas personas en todo el mundo!'
)
