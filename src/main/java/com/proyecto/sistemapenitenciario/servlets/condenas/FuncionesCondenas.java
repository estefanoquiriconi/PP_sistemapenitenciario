package com.proyecto.sistemapenitenciario.servlets.condenas;

import com.proyecto.sistemapenitenciario.logica.condenas.Condena;
import java.util.List;

public class FuncionesCondenas {
    
    public static Condena condenaDeInterno(int id, List<Condena> listaCondenas){
        for(int i = listaCondenas.size()-1; i >= 0; i--){
            if(listaCondenas.get(i).getFkInterno().getIdInterno() == id && listaCondenas.get(i).getEstado()){
                return listaCondenas.get(i);
            }
        }
        return null;
    }

}
