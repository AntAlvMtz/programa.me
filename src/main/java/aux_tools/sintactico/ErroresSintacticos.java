/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aux_tools.sintactico;


/**
 *
 * @author turis
 */
public class ErroresSintacticos  implements Comparable<ErroresSintacticos> {
    private int linea;
    private String mensaje;
    public ErroresSintacticos(int linea,String mensaje){
        this.linea = linea;
        this.mensaje = mensaje;
    }

    public Integer getLinea() {
        return this.linea;
    }

    public void setLinea(int linea) {
        this.linea = linea;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    @Override
    public int compareTo(ErroresSintacticos arg0) {
        return this.getLinea().compareTo(arg0.getLinea());
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        ErroresSintacticos other = (ErroresSintacticos) obj;
        if (this.linea != other.linea) {
            return false;
        }
        return true;
    }
    public String toString(){
        return this.mensaje;
    }
}
