# Crazy4Cats

Blog sobre gatos creado en RoR.

## Descripción

Esta página funciona principalmente mediante el uso de un CRUD para el manejo de las noticias asi como comentarios dejados por otros usuarios y su gestión a través de una base de datos, en este caso PostgreSQL. Ademas hace uso de las relaciones N a N con un sistema de reacciones,  Entre sus funcionalidades destacan:

- Crear nuevas noticias y comentarios que serán almacenados en la base de datos.
- Editar las noticias y comentarios creados con un solo clic.
- Borrar una noticia si no te gusta su contenido o piensas que no es lo mejor lo cual borrara también los comentarios que tuviera.
- Mostrar en su índice todos las noticias creadas, mostrando siempre las últimos noticias al comienzo.
- Muestra los comentarios de cada noticia.
- Ingresa con tu cuenta o crea una propia.
- Los comentarios y publicaciones solo podrán ser borradas por administradores o el mismo usuario que creo la publicación y/o comentario.
- Visitantes podrán dejar sus comentarios en las publicaciones.
- Solo los administradores podrán borrar o editar comentarios dejados por visitantes.

## Importante

Por defecto todo usuario nuevo de la pagina se le asigna el rol de user, si deseas ingresar y probar la pagina como administrador usa la siguiente cuenta: (esto solo en caso de que la pagina este en Heroku u otro servicio)

- mail: <admin@mail.com>
- password: 123456

Si usas este proyecto de forma de forma manual puedes crear tu cuenta de administrador en la consola de rails con los siguientes comandos:

```bash
# para ingresar a la consola de rails
rails c

# Cambia el mail, password, pero recuerda dejar el role "admin"
User.create(email: 'admin@mail.com', password: '123456', role: 'admin')
```

Listos con esos pasos ya podrás probar la pagina como administrador.

Si deseas probar la pagina como un Usuario normal solo crea una cuenta siguiendo el link en la barra de navegaciones

## Visuales

Vista principal de la página:

![Vista principal](/public/index.png)

Si deseas editar una publicación, no te preocupes:

![Vista visitante](/public/visitors.png)

Agrega comentarios de manera sencilla:

![Vista admin](/public/adminView.png)

Muestra los comentarios:

![loguea o crea una cuenta](/public/login.png)

## Empezando 🚀

Estas instrucciones te guiarán para obtener una copia de este proyecto en funcionamiento en tu máquina local con fines de desarrollo y pruebas.

### Pre-requisitos 📋

- Sistema Operativo: Windows, Ubuntu o macOS
- Lenguaje de programación: Ruby 3.2.2
- Framework Rails: 7.0.6
- PostgreSQL: 14.8

### Instalación 🔧

Clona el repositorio con el siguiente comando:

```bash
git clone https://github.com/Delky91/Crazy4Cats
```

En la terminal, accede a la carpeta donde se encuentra el repositorio y ejecuta (recuerda que para que esto funcione, debes tener instalado Ruby y la gema bundle):

```bash
bundle install
```

Inicia la base de datos con el siguiente comando:

```bash
rails db:create db:migrate db:seed
```

Finalmente, ejecuta el proyecto con el siguiente comando y ve a la dirección IP que aparecerá en la consola:

```bash
rails s
```

## Despliegue 📦

Instrucciones para desplegar en Heroku:

asegúrate de tener instalado [Heroku](https://devcenter.heroku.com/articles/heroku-cli#install-the-heroku-cli)

1: En la terminal, inicia sesión en Heroku:

```bash
heroku login
```

2: Crea una aplicación en Heroku:

```bash
heroku create
```

- Es importante copiar el nombre de la aplicación proporcionado por Heroku, ya que se utilizará en el siguiente paso. Por ejemplo: rocky-everglades-49672.

3: Ahora conectaremos el proyecto con nuestra aplicación en Heroku:

```bash
heroku git:remote -a nombre-proyecto-dado_por_heroku
```

4: Realiza un push a Heroku:

```bash
git push heroku main
```

Importante:

Recuerda que Heroku utiliza Git, así que en tu proyecto debes haber iniciado Git. Si clonaste este repositorio, asegúrate de tener la carpeta .git; de lo contrario, realiza los siguientes pasos:

- Inicia el repositorio, agrega los cambios y realiza un primer commit:

```bash
git init
git add .
git commit -m "escribe un mensaje"
```

Si realizaste todo correctamente, ahora podrás agregar el remote mencionado en el paso 3 y seguir con el paso 4.

5a: Debes ir a la página de tu aplicación en la web de [heroku](https://id.heroku.com/login) y dirigirte a la pestaña de la derecha que dice "More":

![More](/public/heroku.png)

5b: Una vez que se despliegue el menú, selecciona la opción "Run console".

6: Una vez que se despliegue la consola, asegúrate de crear la base de datos si aún no está creada y migrar los cambios:

```bash
rails db:create
rails db:migrate
rails db:seed
```

Si seguiste los pasos hasta aquí, deberías poder ver la vista index de la aplicación.

![vista principal](/public/index.png)

## Construido Con 🛠️

- [Ruby](https://www.ruby-lang.org/es/) - El lenguaje utilizado
- [Ruby on Rails](https://rubyonrails.org) - El framework web utilizado
- [Ruby gems](https://rubygems.org) - Gestión de dependencias
- [Postgresql](https://www.postgresql.org) - Sistema de base de datos
- [Bootstrap](https://getbootstrap.com/) - Framework de CSS
- [Devise](https://github.com/heartcombo/devise) - Gema para autentificación y permisos.

## Soporte

Si tienes algún problema o sugerencia, por favor abre un problema [aquí](https://github.com/Delky91/Crazy4Cats/issues).

## Versionado 📌

Use [Git](https://git-scm.com) para el versionado.

## Autores ✒️

- **Luis Miño Bustos** Encuéntrame en [github](https://github.com/Delky91)
