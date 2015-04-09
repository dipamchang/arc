package com.bits_pilani.goa.arc.Registration;

public class CombinationType {
	public String getType(String id){
		String branch = id.substring(4, 6);
		String combtype = "";
		if(branch.equals("A1") || branch.equals("A7") || branch.equals("A8") || branch.equals("B3") || branch.equals("B4") ){
			combtype = "EG";
		}
		else{
			combtype = "WS";
			
		}
		return combtype;
	}

}
