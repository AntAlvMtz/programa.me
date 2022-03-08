package aux_tools.lexico;
import static aux_tools.lexico.Tokens.*;
%%
%class Lexer
%public
%line
%column
%state COMMENT,STRING
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
ID = {L}({L}|{D})*
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

STRING_TEXT=(\\\"|[^\n\r\"]|\\{WhiteSpace}+\\)*
StringCharacter = [^\r\n\"\\]

%{
    StringBuilder string = new StringBuilder();
    public String lexeme;
    public int linea;
    public int columna;
    private int comment_count = 0;
    public String msg = "";
    private int par_apcount = 0;
    public boolean parentesisIguales(){return par_apcount==0;}
%}
%%
<YYINITIAL>{
    inicio_programa |
    fin_programa |
    inicio_var |
    fin_var |
    fin_bloque |
    definir |
    arreglo |
    arregloBi |
    como |
    si |
    verdadero |
    sino |
    hacer |
    mientras |
    repetir |
    veces |
    selector |
    caso |
    inicio_bloque |
    motor |
    display |
    led |
    entero |
    decimal |
    texto |
    prender |
    prender_segmento |
    apagar |
    apagar_segmento |
    seg |
    min |
    hr |
    mostrar |
    girar |
    facil_si |
    facil_sino |
    facil_repetir |
    mostrar |
    incluir |
    selector |
    salir |
    detener |
    para |
    tiempo |
    led_rgb |
    intensidad |
    rojo |
    verde |
    azul |
    o |
    usar|
    y |
    no |
    incrementar |
    decrementar |
    girar |
    logico |
    derecha |
    izquierda |
    asignar|
    estado |
    grados |
    falso {lexeme=yytext();linea = this.yyline+1; return P_Reservada;}
    {espacio} {/*Ignore*/}
    {Comment} {/*Ignore*/}
    
    "\"" { yybegin(STRING); string.setLength(0); string.append("\""); }
    
    "=" {lexeme=yytext();linea = this.yyline+1; return Asignacion;}
    "+" {lexeme=yytext();linea = this.yyline+1; return Suma;}
    "-" {lexeme=yytext();linea = this.yyline+1; return Resta;}
    "*" {lexeme=yytext();linea = this.yyline+1; return Multiplicacion;}
    "/" {lexeme=yytext();linea = this.yyline+1; return Division;}

    {D}+ {
        lexeme=yytext(); linea = this.yyline+1; return Numero;
    }
    
    {D}+ " " ("seg"|"hr"|"min") {
        lexeme=yytext();linea = this.yyline+1; return Tiempo;
    }
    {D}+ ("seg"|"hr"|"min") {
        this.msg = "Código de error 5: Formato de tiempo incorrecto, debe estar separado por un espacio "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    
    {D}+("." [0-9]+)? {
        lexeme=yytext();linea = this.yyline+1; return Decimal;
    }
    {D} ({D}|{L})+ ({L}|{D}) {
    this.msg = "Código de error 6: Cadena inválida "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    "." {D}+ {
    this.msg = "Código de error 3: Formato de número decimal incorrecto, debe tener al menos un dígito antes del punto "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    
    {D} ({L}|".")+ ("."+ [0-9]+) {
        this.msg = "Código de error 6: Cadena inválida "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    "/" {InputCharacter}* {LineTerminator}? {
        this.msg = "Código de error 6: Cadena inválida "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    {D}+ "." {
        this.msg = "Código de error 2: Formato de número decimal incorrecto "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    {D} ({L}|{D})+ ("." [0-9]+) (("." ([0-9]+|"."+))+) {
            this.msg = "Código de error 6: Cadena inválida "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    
    {D}+ ("." ([0-9]+|"."+)+) {
        this.msg = "Código de error 2: Formato de número decimal incorrecto "; lexeme=yytext(); linea = this.yyline+1; return ERROR;
    }
    {ID} {lexeme=yytext(); linea = this.yyline+1; return Identificador;}
    //("(-"{D}+")")|

    "(" {
        par_apcount++;
        lexeme=yytext();linea = this.yyline+1; return SA_Parentesis;
    }
    ")" {
        par_apcount--;
        lexeme=yytext();linea = this.yyline+1; return SA_Parentesis;
    }
    "{"|"}" {
        lexeme=yytext();linea = this.yyline+1; return SA_Llaves;
    }
    "["|"]" {
        lexeme=yytext();linea = this.yyline+1; return SA_Corchetes;
    }
    ";"|">"|"<"|"#"|"$"|":"|","|"."|"!"|"," {
        lexeme=yytext();linea = this.yyline+1; return Simbolo_Especial;
    }
    "." (prender|girar|apagar|estado|encendido|apagado|rojo|verde|azul) {lexeme=yytext();linea = this.yyline+1; return Propiedad;}
     . {this.msg = "Código de error 1: Símbolo no reconocido ";lexeme=yytext();linea=this.yyline+1;return ERROR;}
}
<COMMENT> {
  "/*" { comment_count++; }
  "*/" { if (--comment_count == 0) yybegin(YYINITIAL); }
  {CommentContent} { }
}
<STRING> {
  \"                             { yybegin(YYINITIAL);string.append("\"");lexeme=string.toString();linea=this.yyline+1;return Texto;}
  
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
    this.msg = "Código de error 4: La cadena no esta cerrada "; lexeme=string.toString(); linea = this.yyline+1; yybegin(YYINITIAL); return ERROR; }
  \\.                            { this.msg = "Código de error 4: La cadena no esta cerrada "; lexeme=string.toString(); linea = this.yyline+1; yybegin(YYINITIAL); return ERROR; }
  {LineTerminator}               { this.msg = "Código de error 4: La cadena no esta cerrada "; lexeme=string.toString(); linea = this.yyline+1; yybegin(YYINITIAL); return ERROR; }
}
