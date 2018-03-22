package com.tienda.gestores;



import java.util.Comparator;

import com.tienda.entidades.Producto;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author angel
 */
 public class comparadorProductosNombre implements Comparator<Producto> {

    @Override
    public int compare(Producto o1, Producto o2) {
        return o1.getNombre().compareTo(o2.getNombre());
        
    }

   

   
}
