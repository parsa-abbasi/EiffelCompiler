import java.io.File;

public class Main {

	public static void main(String[] args) {
		String currentDir = System.getProperty("user.dir");
		jflex.Main.generate(new File(currentDir + "\\src" + "\\Eiffel.flex"));
	}
	//This function get the flex file and make it's java class using JFlex library
}
