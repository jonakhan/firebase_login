INTRODUCCIÓN
El objetivo de este proyecto es desarrollar una aplicación móvil que permita a los usuarios registrarse, iniciar sesión y recuperar contraseñas utilizando Flutter y Firebase. La aplicación también incluye una imagen de fondo y un pie de página que indica el desarrollador.
REQUISITOS PREVIOS
Antes de comenzar el desarrollo, se deben cumplir ciertos requisitos:
o	Instalación de Flutter: Asegurarse de tener el SDK de Flutter instalado en la máquina de desarrollo.
o	Configuración de Firebase: Crear un proyecto en Firebase y habilitar la autenticación por correo electrónico y contraseña.
o	Editor de Código: Utilizar un editor de código como Visual Studio Code o Android Studio para el desarrollo.
CONFIGURACIÓN DE FIREBASE
Para integrar Firebase en la aplicación, se deben seguir los siguientes pasos:
1.	Crear un Proyecto en Firebase: Acceder a la consola de Firebase y crear un nuevo proyecto.
2.	Registrar la Aplicación: Registrar la aplicación Android en el proyecto de Firebase y descargar el archivo de configuración google-services.json, que debe ser colocado en la carpeta android/app del proyecto Flutter.
3.	Habilitar Métodos de Autenticación: En la sección de "Authentication" de Firebase, habilitar el método de autenticación por correo electrónico y contraseña.
DEPENDENCIAS DEL PROYECTO
Para utilizar Firebase y otras funcionalidades en la aplicación, se deben agregar ciertas dependencias en el archivo de configuración del proyecto (pubspec.yaml). Las dependencias principales incluyen:
•	firebase_core: Para inicializar Firebase en la aplicación.
•	firebase_auth: Para manejar la autenticación de usuarios.
•	logger: Para registrar mensajes y errores en la aplicación.
DESARROLLO DE LA APLICACIÓN
Estructura de la Aplicación
La aplicación se compone de varias pantallas, siendo la principal la pantalla de inicio de sesión. Esta pantalla incluye:
•	Campos de Entrada: Dos campos de texto para que los usuarios ingresen su correo electrónico y contraseña.
•	Botones de Acción: Botones para iniciar sesión, registrarse y recuperar la contraseña.
•	Imagen de Fondo: Una imagen que se carga desde una URL para mejorar la interfaz de usuario.
FUNCIONALIDADES IMPLEMENTADAS
•	Inicio de Sesión: Permite a los usuarios autenticarse utilizando su correo electrónico y contraseña. Si el inicio de sesión es exitoso, se redirige al usuario a una pantalla de bienvenida.
•	Registro de Usuario: Permite a los nuevos usuarios crear una cuenta. Se valida que los campos no estén vacíos antes de proceder.
•	Recuperación de Contraseña: Permite a los usuarios restablecer su contraseña mediante el envío de un correo electrónico.
•	Interfaz de Usuario: La aplicación utiliza un tema oscuro y presenta una imagen de fondo, mejorando la experiencia visual.
PRUEBAS Y VALIDACIÓN
Una vez desarrollada la aplicación, se realizaron pruebas en dispositivos físicos y emuladores para verificar que todas las funcionalidades funcionaran correctamente. Se prestó especial atención a la validación de entradas y a la gestión de errores durante el proceso de autenticación.
