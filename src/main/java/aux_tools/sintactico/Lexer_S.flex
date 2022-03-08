package aux_tools.sintactico;
import java_cup.runtime.Symbol;
%%
%class Lexer_S
%public
%unicode
%cup
%char
%full
%line
%column
%state COMMENT,STRING
%type java_cup.runtime.Symbol
L = [a-zA-Z_]+
D = [0-9]+
espacio = [ ,\t,\r,\n]+
InputCharacter = [^\r\n]
LineTerminator = (\r|\n|\r\n)
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
WhiteSpace     = {LineTerminator} | [ \t\f]
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

STRING_TEXT = (\\\"|[^\n\r\"]|\\{WhiteSpace}+\\)*

StringCharacter = [^\r\n\"\\]

%{
    StringBuilder string = new StringBuilder();
    public int linea;
    public int columna;
    private int comment_count = 0;
    public String msg = "";
    private int par_apcount = 0;
    public boolean parentesisIguales(){return par_apcount==0;}
    private Symbol symbol(int type, Object value){
        return new Symbol(type,yyline,yycolumn,value);
    }
    private Symbol symbol(int type){
        return new Symbol(type,yyline,yycolumn);
    }
%}
%%
<YYINITIAL>{
        "," {return new Symbol(sym.COMA,(int) yychar,yyline,yytext());}
    "decimal" {return new Symbol(sym.decimal,(int) yychar,yyline,yytext());} 
    "entero" {return new Symbol(sym.entero,(int) yychar,yyline,yytext());} 
    "texto" {return new Symbol(sym.texto,(int) yychar,yyline,yytext());} 
    "logico" {return new Symbol(sym.logico,(int) yychar,yyline,yytext());}    
    "usar" {return new Symbol(sym.usar,(int) yychar,yyline,yytext());}    
    

    "tiempo" {return new Symbol(sym.tiempo,(int) yychar,yyline,yytext());} 
    

    "rojo" {return new Symbol(sym.rojo,(int) yychar,yyline,yytext());} 
    "verde" {return new Symbol(sym.verde,(int) yychar,yyline,yytext());} 
    "azul" {return new Symbol(sym.azul,(int) yychar,yyline,yytext());} 
    "visualizar" {return new Symbol(sym.visualizar,(int) yychar,yyline,yytext());} 
    
    
    "asignar" {return new Symbol(sym.asignar,(int) yychar,yyline,yytext());} 
    "detener" {return new Symbol(sym.detener,(int) yychar,yyline,yytext());} 
    "arreglo" {return new Symbol(sym.arreglo,(int) yychar,yyline,yytext());} 
    "arregloBi" {return new Symbol(sym.arregloBi,(int) yychar,yyline,yytext());} 
    "apagar" {return new Symbol(sym.apagar,(int) yychar,yyline,yytext());} 
    "inicio_bloque" {return new Symbol(sym.inicio_bloque,(int) yychar,yyline,yytext());}  
    "caso" {return new Symbol(sym.caso,(int) yychar,yyline,yytext());} 
    "como" {return new Symbol(sym.como,(int) yychar,yyline,yytext());}  
    "definir" {return new Symbol(sym.definir,(int) yychar,yyline,yytext());}  
    "derecha" {return new Symbol(sym.derecha,(int) yychar,yyline,yytext());}  
    "display" {return new Symbol(sym.display,(int) yychar,yyline,yytext());}   
    "fin_bloque" {return new Symbol(sym.fin_bloque,(int) yychar,yyline,yytext());}
    "facil_repetir" {return new Symbol(sym.facil_repetir,(int) yychar,yyline,yytext());}
    "facil_si" {return new Symbol(sym.facil_si,(int) yychar,yyline,yytext());}  
    "facil_sino" {return new Symbol(sym.facil_sino,(int) yychar,yyline,yytext());}  
    "falso" {return new Symbol(sym.falso,(int) yychar,yyline,yytext());}  
    "fin_programa" {return new Symbol(sym.fin_programa,(int) yychar,yyline,yytext());}  
    "fin_var" {return new Symbol(sym.fin_var,(int) yychar,yyline,yytext());}  
    "girar" {return new Symbol(sym.girar,(int) yychar,yyline,yytext());} 
    "grados" {return new Symbol(sym.grados,(int) yychar,yyline,yytext());}  
    "hacer" {return new Symbol(sym.hacer,(int) yychar,yyline,yytext());}  
    "hr" {return new Symbol(sym.hr,(int) yychar,yyline,yytext());}  
    "incluir" {return new Symbol(sym.incluir,(int) yychar,yyline,yytext());}  
    "inicio_programa" {return new Symbol(sym.inicio_programa,(int) yychar,yyline,yytext());}  
    "inicio_var" {return new Symbol(sym.inicio_var,(int) yychar,yyline,yytext());}  
    "intensidad" {return new Symbol(sym.intensidad,(int) yychar,yyline,yytext());}  
    "incrementar" {return new Symbol(sym.incrementar,(int) yychar,yyline,yytext());}  
    "decrementar" {return new Symbol(sym.decrementar,(int) yychar,yyline,yytext());}  
    "izquierda" {return new Symbol(sym.izquierda,(int) yychar,yyline,yytext());}  
    "led" {return new Symbol(sym.led,(int) yychar,yyline,yytext());}  
    "ledRGB" {return new Symbol(sym.ledRGB,(int) yychar,yyline,yytext());} 
    "mientras" {return new Symbol(sym.mientras,(int) yychar,yyline,yytext());}  
    "min" {return new Symbol(sym.min,(int) yychar,yyline,yytext());}  
    "mostrar" {return new Symbol(sym.mostrar,(int) yychar,yyline,yytext());} 
    "motor" {return new Symbol(sym.motor,(int) yychar,yyline,yytext());}
    "para" {return new Symbol(sym.para,(int) yychar,yyline,yytext());}  
    "prender" {return new Symbol(sym.prender,(int) yychar,yyline,yytext());}  
    "repetir" {return new Symbol(sym.repetir,(int) yychar,yyline,yytext());}  
    "salir" {return new Symbol(sym.salir,(int) yychar,yyline,yytext());}  
    "seg" {return new Symbol(sym.seg,(int) yychar,yyline,yytext());}  
    "selector" {return new Symbol(sym.selector,(int) yychar,yyline,yytext());} 
    "si" {return new Symbol(sym.si,(int) yychar,yyline,yytext());}  
    "sino" {return new Symbol(sym.sino,(int) yychar,yyline,yytext());}  
    "tiempo" {return new Symbol(sym.tiempo,(int) yychar,yyline,yytext());}  
    "veces" {return new Symbol(sym.veces,(int) yychar,yyline,yytext());}  
    "verdadero" {return new Symbol(sym.verdadero,(int) yychar,yyline,yytext());}
    "y" {return new Symbol(sym.y,(int) yychar,yyline,yytext());}
    "o" {return new Symbol(sym.o,(int) yychar,yyline,yytext());}
    "no" {return new Symbol(sym.no,(int) yychar,yyline,yytext());}
    "estado" {return new Symbol(sym.estado,(int) yychar,yyline,yytext());}
    {espacio} {/*Ignore*/}
    {Comment} {/*Ignore*/}
    "\"" { yybegin(STRING); string.setLength(0); string.append("\""); }
    ";" {return new Symbol(sym.PUNTO_COMA,(int) yychar,yyline,yytext());}
    "." {return new Symbol(sym.PUNTO,(int) yychar,yyline,yytext());}
    ":" {return new Symbol(sym.DosPuntos,(int) yychar,yyline,yytext());}
    "(" {return new Symbol(sym.Par_a,(int) yychar,yyline,yytext());}
    ")" {return new Symbol(sym.Par_c,(int) yychar,yyline,yytext());}
    "{" {return new Symbol(sym.Lla_a,(int) yychar,yyline,yytext());}
    "}" {return new Symbol(sym.Lla_c,(int) yychar,yyline,yytext());}
    "[" {return new Symbol(sym.Cor_a,(int) yychar,yyline,yytext());}
    "]" {return new Symbol(sym.Cor_c,(int) yychar,yyline,yytext());}

    "==" {return new Symbol(sym.Igual,(int) yychar,yyline,yytext());}
    "=" {return new Symbol(sym.Asignacion_s,(int) yychar,yyline,yytext());}
    "+" {return new Symbol(sym.Suma,(int) yychar,yyline,yytext());}
    "-" {return new Symbol(sym.Resta,(int) yychar,yyline,yytext());}
    "*" {return new Symbol(sym.Mul,(int) yychar,yyline,yytext());}
    "/" {return new Symbol(sym.Div,(int) yychar,yyline,yytext());}
    
    "<" {return new Symbol(sym.Menor,(int) yychar,yyline,yytext());}
    ">" {return new Symbol(sym.Mayor,(int) yychar,yyline,yytext());}
    "!=" {return new Symbol(sym.Diferente,(int) yychar,yyline,yytext());}
    ">=" {return new Symbol(sym.Mayor_i,(int) yychar,yyline,yytext());}
    "<=" {return new Symbol(sym.Menor_i,(int) yychar,yyline,yytext());}
    "/" {InputCharacter}* {LineTerminator}? {
        this.msg = "Código de error 6: Cadena inválida ";return new Symbol(sym.ERROR,(int) yychar,yyline,yytext());
    }
    {D}+ {
        return new Symbol(sym.Numero,(int) yychar,yyline,new Integer(yytext()));
    }
    
    {D}+ " " ("seg"|"hr"|"min") {
        return new Symbol(sym.Tiempo,(int) yychar,yyline,yytext());
    }
    {D}+ ("seg"|"hr"|"min") {
        this.msg = "Código de error 5: Formato de tiempo incorrecto, debe estar separado por un espacio ";  return new Symbol(sym.ERROR,(int) yychar,yyline,yytext());
    }
    
    ([0-9]+ "." {D}) {
        return new Symbol(sym.Decimal,(int) yychar,yyline,new Double(yytext()));
    }
    
    {L}({L}|{D})* {return new Symbol(sym.Identificador,(int) yychar,yyline,yytext());}
    
    //"." (prender|girar|apagar|estado) {return new Symbol(sym.Propiedad,(int) yychar,yyline,yytext());}
     . {this.msg = "Código de error 1: Símbolo no reconocido ";return new Symbol(sym.ERROR,(int) yychar,yyline,yytext());}
}
<COMMENT> {
  "/*" { comment_count++; }
  "*/" { if (--comment_count == 0) yybegin(YYINITIAL); }
  {CommentContent} { }
}
<STRING> {
  "\""                             { yybegin(YYINITIAL);string.append("\"");return new Symbol(sym.Texto,(int) yychar,yyline,string.toString());}
  
  {StringCharacter}+             { string.append( yytext() ); }
  
  /* escape sequences */
  "\\b"                          { string.append( '\b' ); }
  "\\t"                          { string.append( '\t' ); }
  "\\n"                          { string.append( '\n' ); }
  "\\f"                          { string.append( '\f' ); }
  "\\r"                          { string.append( '\r' ); }
  "\\\""                         { string.append( '\"' ); }
  "\\'"                          { string.append( '\'' ); }
  "\\\\"                         { string.append( '\\' ); }
  
  /* error cases */
  ";" {
    this.msg = "Código de error 4: La cadena no esta cerrada ";  yybegin(YYINITIAL); return new Symbol(sym.ERROR,(int) yychar,yyline,yytext()); }
  \\.                            { this.msg = "Código de error 4: La cadena no esta cerrada ";  yybegin(YYINITIAL); return new Symbol(sym.ERROR,(int) yychar,yyline,yytext()); }
  {LineTerminator}               { this.msg = "Código de error 4: La cadena no esta cerrada ";  yybegin(YYINITIAL); return new Symbol(sym.ERROR,(int) yychar,yyline,yytext()); }
}