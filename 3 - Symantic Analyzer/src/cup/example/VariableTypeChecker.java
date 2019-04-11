package cup.example;

public class VariableTypeChecker {
	private String name;
	private String type;
	
	public VariableTypeChecker(String name, String type) {
		this.name = name;
		this.type = type;
	}
	
	public String getName(){
		return name;
	}
	
	public String getType(){
		return type;
	}
}
