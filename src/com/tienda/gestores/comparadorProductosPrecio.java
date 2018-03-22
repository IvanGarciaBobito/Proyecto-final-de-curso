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
 public class comparadorProductosPrecio implements Comparator<Producto> {

    @Override
    public int compare(Producto o1, Producto o2) {
        if (o1.getPrecio()>o2.getPrecio()){
            return 1;
        } else if (o2.getPrecio() > o1.getPrecio()){
            return -1;
        } else {
            return 0;
        }
    }

   

   
}
