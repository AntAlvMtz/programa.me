package aux_tools;

import java.awt.Font;

public class FontSelector {

    private static String[] fonts = {"Arial", "Consolas", "Courier New", "Lucida Console", "Tahoma", "Times New Roman", "Verdana",};
    private static int[] sizez = {12, 14, 16, 18, 20, 22, 24, 26, 28, 30};
    private static int[] styles = {Font.PLAIN, Font.BOLD, Font.ITALIC, (Font.BOLD | Font.ITALIC)};
    private static Font temp;
    static public Font select(int[] options){
        temp = new Font(fonts[options[0]],styles[options[1]],sizez[options[2]]);
        return temp;
    }
}
