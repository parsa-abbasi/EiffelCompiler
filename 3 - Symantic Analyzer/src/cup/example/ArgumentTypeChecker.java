package cup.example;

import java.util.ArrayList;

public class ArgumentTypeChecker {
	private String name;
	private ArrayList<Argument> arguments = new ArrayList<Argument>();

	public ArgumentTypeChecker(String name) {
		this.name = name;
	}

	public boolean addArgument(String argName, String argType){
		for(int i=0 ; i<arguments.size() ; i++){
			if(arguments.get(i).getName().equals(argName)){
				return false;
			}
		}
		arguments.add(new Argument(argName, argType));
		return true;
	}

	public String getAnArgumentType(int argIndex){
		return arguments.get(argIndex).getType();
	}

	public String getAnArgumentType(String argName){
		for(int i=0 ; i<arguments.size() ; i++){
			if(arguments.get(i).getName().equals(argName)){
				return arguments.get(i).getType();
			}
		}
		return "NotFound";
	}

	public boolean argExist(String argName){
		for(int i=0 ; i<arguments.size() ; i++){
			if(arguments.get(i).getName().equals(argName)){
				return true;
			}
		}
		return false;
	}

	public String getName(){
		return name;
	}

	public int getArgSize(){
		return arguments.size();
	}
}
