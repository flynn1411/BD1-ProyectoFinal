
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

## Domingo 6 de Diciembre

- (Gabriel): Se creó la ventana para la administración de usuarios el cual solamente sera accedido por el usuario con privilegios de Administrador. Se agregó una vista a la base de datos para la visualizacion de los usuarios operadores, esta ha sido implementada en la ventana del administrador. En el mySQLEngine se creó un método general para el insertado de datos y tambien se agregaron los metodos necesarios para la visualizacion de los usuarios operadores seleccionando la vista creada previamente.

## Lunes 7 de Diciembre

- (Gabriel): Se modificó el programa de tal manera que al momento de cargar un dibujo la pantalla del dibujo se actualice con el dibujo seleccionado.

- (Caleb y Josué): Se comenzaron a trabajar en los triggers para automatizar la bitacora en la base A.

## Martes 8 de Diciembre

- (Gabriel): Se llevó a cabo la tarea de elaborar el código necesario para generar la carga de los dibujos en el programa. Esto consiste en crear un atributo con el id del dibujo en la aplicación que se vaya alterando cada vez que se haya cargado o creado un nuevo dibujo.

- (Caleb y Josué): Se crearón más Triggers para los otros eventos existentes mencionados en la definición del proyecto. Asi como la documentación del los scripts SQL.

## Miercoles 9 de Diciembre

- (Gabriel): Se cambiaron algunas consultas basicas dentro del motor de mysql por procedimientos almacenados escritos en la parte de la base de datos.

- (Caleb y Josué): Se agregó el campo "txt_elementName" en la bitacora de la base A, esto con la intención de obtener una tabla de registros más detallada. Asímismo se logró hacer una comparación de contraseña más exacta (tomando en cuenta las mayusculas y minusculas).

## Viernes 11 de Diciembre

- (Gabriel y Fernando) Se organizaron algunas funciones de la ventana de admin al igual que se agregaron la funcionalidad completa de agregar usuarios y poder modificarlos cambiando su nombre y contraseña, se implemento correctamente la verificación en las tablas para verificar si al agregar un usuario el usuario ya existe en la base de datos y de igual forma para la modificacion de un usuario no puede agregar el mismo nombre de un usuario ya existente. Se agrego el reconocimiento de la configuración de el lapiz su color el radio y lo ancho de lapiz y desde el modo usuario se puede modificarlos y que se guarden los valores en la base de datos.
