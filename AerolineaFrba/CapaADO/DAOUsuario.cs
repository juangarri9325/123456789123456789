﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
 
using AerolineaFrba.Herramientas;

using AerolineaFrba.ConstructorDeClases;


namespace AerolineaFrba.CapaADO
{
    class DAOUsuario : SqlConnector
    {
        
        public static void AgregarUsuario(Persona usuario)
        {

            executeProcedure("spinsertar_usuario", 1, usuario.Nombre, usuario.Apellido, usuario.Dni, usuario.Direccion, usuario.Telefono, usuario.Email, usuario.FechaNac, usuario.Estado);

        }

        //Metodo Mostrar
        public static DataTable Mostrar()
        {
              return retrieveDataTable("spmostrar_usuario");
        }

        public static DataTable buscarUsuario(string textoBuscar)
        {
            return retrieveDataTable("spbuscar_usuario", textoBuscar);
        }

        public static void EditarUsuario(Persona usuario)
        {
            executeProcedure("speditar_usuario", 1, usuario.Nombre, usuario.Apellido, usuario.Dni, usuario.Direccion, usuario.Telefono, usuario.Email, usuario.FechaNac);
        }

        public static void EliminarUsuario(int Dni)
        {
            executeProcedure("speliminar_usuario", Dni);
        }
        
        public static void darDeBajaUsuario(int Dni)
        {
              executeProcedure("spbaja_usuario", Dni);
        }

    }
    

}
