Idle Shutdowner
---------------

Apaga automáticamente el equipo después de un tiempo de inactividad (ratón o teclado).

Se puede configurar el número de horas de inactividad en el archivo /etc/default/idle_shutdown con la propiedad IDLE_TIME.

Instalación
-----------
Instala el paquete xprintidle previamente (`sudo apt-get install xprintidle`) o realiza un `sudo apt-get install -f` después de instalar.

Descarga el paquete [idleshutdowner_0.1-1_all.deb](https://github.com/Canx/idleshutdowner/raw/master/idleshutdowner_0.1-1_all.deb) y instala con `sudo dpkg -i idleshutdowner_0.1-1_all.deb`.

Créditos
--------
Me he limitado a empaquetar el script publicado en el blog de Paperspace, titulado [Auto-Shutdown for Linux machines through the terminal and SSH](https://support.paperspace.com/hc/en-us/articles/115002807447--Auto-Shutdown-for-Linux-machines-through-the-terminal-and-SSH)
