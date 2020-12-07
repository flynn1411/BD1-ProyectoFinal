
## Martes 24 de Noviembre 

- (Ariel) Hoy se discutio por primera vez la definición del proyecto utilizando Discord como plataforma de reuniones.

## Viernes 27 de Noviembre

- (Ariel, Caleb y Gabriel) Se creó el diagrama Entidad Relación inicial y el modelo MVC para comenzar a trabajar y analizar como crear
el programa.

## Miercoles 2 de Diciembre  

- (Fernando) Se creo la ventana para administrar el login y el empiezo de la clase de autentificacion de usuario ya sea normal o de administrador  

- (Caleb y Josúe): Realizamos una reestructuración del diagrama ER y se comenzó con los archivos DDS.sql y DMS.sql para cada base de datos acorde. Asímimsmo, una mejor completación del diseño MVC.

- (Gabriel): Se editó el código de la  aplicación de dibujo de tal manera que funcione alrededor de archivos json y no en doumentos XML como estaba implementado en un principio. 

## Jueves 3 de Diciembre  

- (Caleb y Josué) Se actualizó el diagrama entidad relación (ER), agregando a los atributos su respectivo tipo de dato y además mejorando el diseño.

- (Gabriel): Se creó un procedimiento almacenado de tal manera que se pueda usar para llevar a cabo la tarea de autenticación. Tambien se creó la clase de MySQLEngine para crear una conexión de la base de datos con los archivos python y se agregó un método para hacer llamados a procedimientos almacenados.

## Viernes 4 de Diciembre  

- (Gabriel y Fernando) Arreglo de bug de la venta de login, se conecto el mysqlConector con la ventana de login para poder hacer las verificaciones, se creo la clase encriptación al igual que la ventana para las modificaciones del usuario. El programa ya distigue entre los tipos de usuario. Se agregaron variables para futuros arreglos como lo es el engine y el id de usuario con su nombre casi listo para poder almacenar info en la base de datos.

- (Caleb y Josué) Completación del archivo DDS.sql para la base de datos A asi como su diagrama ER.

## Sabado 5 de Diciembre 

- (Gabriel y Fernando): Se crearon las ventanas para la carga y guardado de dibujo. Se implementaron las interfaces creadas al proyecto. Tambien se alteraron métodos de la aplicación del dibujo, estos cambios abarcan la manera en como el programa guardaba los archivos json, el programa original guardaba los archivos json en el directorio seleccionado por el usuario. Debido a esto se necesito alterar el proceso de guardado y carga de tal manera que todo los archivos guardados se encuentren en la base de datos. Para cargar un dibujo ahora es necesario hacer transacciones tomando en cuenta el usuario actual. 

## Sabado 6 de Diciembre 
- (Gabriel): Se creó la ventana para la administración de usuarios el cual solamente sera accedido por el usuario con privilegios de Administrador. Se agregó una vista a la base de datos para la visualizacion de los usuarios operadores, esta ha sido implementada en la ventana del administrador. En el mySQLEngine se creó un método general para el insertado de datos y tambien se agregaron los metodos necesarios para la visualizacion de los usuarios operadores seleccionando la vista creada previamente.
