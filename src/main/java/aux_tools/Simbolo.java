package aux_tools;

public class Simbolo implements Comparable<Simbolo> {

    public String lexema;
    public String tipo;
    public int linea_declaracion;
    public Object valor;

    public Simbolo(String lexema, String tipo, int linea_declaracion, Object valor) {
        this.lexema = lexema;
        this.tipo = tipo;
        this.linea_declaracion = linea_declaracion;
        this.valor = valor;
    }

    public Simbolo(String lexema, int linea_declaracion) {
        this.lexema = lexema;
        this.linea_declaracion = linea_declaracion;
        this.tipo = "";
        this.valor = null;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getLinea_declaracion() {
        return linea_declaracion;
    }

    public void setLinea_declaracion(int linea_declaracion) {
        this.linea_declaracion = linea_declaracion;
    }

    public Object getValor() {
        return valor;
    }

    public void setValor(Object valor) {
        this.valor = valor;
    }

    @Override
    public int compareTo(Simbolo sim) {
        return this.getLexema().compareTo(sim.getLexema());
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
        Simbolo other = (Simbolo) obj;
        if (lexema != other.lexema) {
            return false;
        }
        if (lexema == null) {
            if (other.lexema != null) {
                return false;
            }
        } else if (!lexema.equals(other.lexema)) {
            return false;
        }
        return true;
    }
}
