import java.io.File;

public class Main {

	public static void main(String[] args) {
		String currentDir = System.getProperty("user.dir");
		jflex.Main.generate(new File(currentDir + "\\src" + "\\Eiffel.flex"));
	}

}