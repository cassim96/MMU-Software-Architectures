/**
 *  This is the main class for my compiler
 */
package decaf;

import java.io.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java6G6Z1010.tools.CLI.*;

/**
 * @author Cassim Mansoor 14029304
 *
 */
public class Main {

	/**
	 * @param args - command line arguments
	 */
	public static void main(String[] args) {
		try {
            CLI.parse (args, new String[0]);
            
            InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);
            ANTLRInputStream antlrIOS = new ANTLRInputStream(inputStream);

            if (CLI.target == CLI.SCAN || CLI.target == CLI.DEFAULT)
            {
            	//declare new decaf lexer
                DecafLexer Lexer = new DecafLexer(antlrIOS);
                //declare Token as token
                Token token;
                //boolean done equals false
                boolean done = false;
                while (!done)
                {
                    try
                    {
                        for (token=Lexer.nextToken();
                        		//get type from token lexer
                            token.getType()!=Token.EOF; token=Lexer.nextToken())
                        {
                            String type = "";
                            //get string text from token
                            String text = token.getText();

        
                            switch (token.getType())
                            {
                            //id type is identifier
                            case DecafLexer.ID:
                                type = " IDENTIFIER";
                                break;
                            }
                            System.out.println (token.getLine() + type + " " + text);
                        }
                        done = true;
                    } catch(Exception e) {
                        // print the error:
                        System.out.println(CLI.infile+" "+e);
                    }
                }
            }
            else if (CLI.target == CLI.PARSE)
            {
            	//declare a new lexer
                DecafLexer lexer = new DecafLexer(antlrIOS);
                //declare a new token stream
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                //declare a new parser
                DecafParser parser = new DecafParser();
                //parser statement into parser tree
                ParseTree tree = parser.statement(); break;
                if (CLI.debug) {
                	//new tree listener
                    TreePrinterListener listener = new TreePrinterListener(parser);
	                ParseTreeWalker.DEFAULT.walk(listener, tree);
	                //format string
	                String formatted = listener.toString();
	                //print line formatted 
	                System.out.println(formatted);
                }
            }
            
        } catch(Exception e) {
            // print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}
