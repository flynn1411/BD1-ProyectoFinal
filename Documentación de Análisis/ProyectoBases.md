## Controlador 
- El programa debera contener la contraseña del administrador para la encriptacion. []

- Cada dato que se envia a la base de datos debe ser encriptada previamente []

- Cada dato que se recibe previamente debe ser desencriptada previamente []

- Queries para la conexion de la base de datos y el controlador (**Vistas, SP , Inserts, Selects, Deletes y Update**) [...]

- Pasar todas las ventanas al folder de "windows" []

## Inicio de sesion

- Crear una configuracion por defecto cada vez que se cree un usuario, **usar Triggers** []

- cuando inicie sesión un usuario se debe asignar la ultima configuracion declarada por el usuario. **Usar un procedimiento almacenado** []


## Drawing App

- Crear un atributo (currentDrawID) que almacene el ID del dibujo si es que se ha cargado uno previamente. [x]

- Mostrar en la interfaz el nombre del dibujo actual se es que se cargo previamente, de lo contrario mostrar "Untitled". [x]

- Cada vez que se guarde un dibujo que se ha cargado previamente se sobrescribira en la base de datos. [x]

- Crear un boton Save-as para guardar nuevos dibujos sin importar si se ha cargado uno previamente. []

- Cada vez que se cambie la configuracion se debera alterar tal informacion a la base de datos. []

- crear boton delete draw



## Admin

- Cada vez que el admin seleccione un usuario se deberan mostrar en pantalla sus configuraciones correspondientes [x]

- Agregar funcionalidad a los botones de Agregar, modificar y borrar usuario [...]

- Alterar la configuracion del usuario cuando se oprima el boton guardar [x]

- *(opcional)*  Se puede hacer uso de Regex para hacer validaciones para los datos de configuraciones agregados. []

- Interfaz para ver los dibujos de un/todos usuario y eliminarlos []

## Cargar dibujo

- Al seleccionar un dibujo y oprimir "open" se debera visualizar el dibujo en la ventana Drawing App y se debera almacenar el currentDrawID [x]


## Guardar dibujo

- Al guardar un dibujo se debera alterar el atributo de currentDrawID [x]


## Base de datos


- Se debe agregar foreign constraint de tal manera que cuando se elimine un usuario tambien se eliminen todos los dibujos, esto se hara mediante la regla **"CASCADE"**

- La creación de registro mediante triggers [...]

- Aplicar Case-Sensitive [X]

- *(opcional)* Se puede agregar una columna de fecha de creacion para la tabla de Usuarios. 

- *(opcional)* Se puede agregar una columna de fecha de modificacion para la tabla de Configuración.

