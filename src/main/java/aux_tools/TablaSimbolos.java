/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aux_tools;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;

/**
 *
 * @author turis
 */
public class TablaSimbolos {
     public ArrayList<Simbolo> ListaTokens;
     public ArrayList<Simbolo> ListaTokensS;
     
     
    public TablaSimbolos() {
        this.ListaTokens = new ArrayList<Simbolo>();
        this.ListaTokensS = new ArrayList<Simbolo>();
    }

    public void addToken(Simbolo t) {
        if (!buscarToken(t)) {
            this.ListaTokens.add(t);
            sortTabla();
        }
    }
    
    public void addTokenS(Simbolo t) {
            this.ListaTokensS.add(t);
            sortTabla();
    }
    
    public Boolean buscarTokenS(String t) {
        if(this.ListaTokensS.isEmpty()){
            return false;
        }
        for (Simbolo tokens : this.ListaTokensS) {
            if (tokens.getLexema().equals(t)) {
                return true;
            }
        }
        return false;
    }
    
    public void updateToken(Simbolo t) {
        if (buscarToken(t)) {
            this.ListaTokens.add(t);
            sortTabla();
        }
    }

    public void sortTabla() {
        Collections.sort(ListaTokens);
    }
    public void clear(){
        this.ListaTokens.clear();
    }

    public Boolean buscarToken(Simbolo t) {
        if(this.ListaTokens.isEmpty()){
            return false;
        }
        for (Simbolo tokens : this.ListaTokens) {
            if (tokens.getLexema().equals(t.getLexema())) {
                return true;
            }
        }
        return false;
    }
    
    public Boolean buscarTipoDato(String t) {
        if(this.ListaTokens.isEmpty()){
            return false;
        }
        for (Simbolo tokens : this.ListaTokens) {
            if (tokens.getLexema().equals(t) && !tokens.getTipo().equals("")) {
                return true;
            }
        }
        return false;
    }
    
    public Boolean buscarValor(String t) {
        if(this.ListaTokens.isEmpty()){
            return false;
        }
        for (Simbolo tokens : this.ListaTokens) {
            if (tokens.getLexema().equals(t) && tokens.valor != null) {
                return true;
            }
        }
        return false;
    }
    
    public Boolean buscarToken(String t) {
        if(this.ListaTokens.isEmpty()){
            return false;
        }
        for (Simbolo tokens : this.ListaTokens) {
            if (tokens.getLexema().equals(t)) {
                return true;
            }
        }
        return false;
    }
    public void ubicarToken(String t,String tipo) {
        if(this.ListaTokens.isEmpty()){
            return;
        }
        for (int l = 0; l < ListaTokens.size();l++) {
            if (ListaTokens.get(l).getLexema().equals(t)) {
                ListaTokens.get(l).setTipo(tipo);
            }
        }
    }
    public void ubicarToken(String t,String tipo,Object valor) {
        if(this.ListaTokens.isEmpty()){
            return;
        }
        for (int l = 0; l < ListaTokens.size();l++) {
            if (ListaTokens.get(l).getLexema().equals(t)) {
                ListaTokens.get(l).setTipo(tipo);
                ListaTokens.get(l).setValor(valor);
            }
        }
    }
    public ArrayList<Simbolo> verTablaSimbolos(){
        return this.ListaTokens;
    }
    
    
}
