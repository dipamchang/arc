package com.bits_pilani.goa.arc.Registration;

import java.util.List;

import com.bits_pilani.goa.arc.Dao.Combinations;
/**
 * 
 * @author dipamchang
 * @email dipamchang@gmail.com
 */
public class CombinationType {
	public String getType(String id){
		String branch = id.substring(4, 6);
		String combtype = "";

		Combinations combInfo = new Combinations();
		List<String> EGBranchList = combInfo.getGroupInfo("EG");


		if(EGBranchList.contains(branch)){
			combtype = "EG";
		} else {
			combtype = "WS";
		}

		//		if(branch.equals("A1") || branch.equals("A7") || branch.equals("A8") || branch.equals("B3") || branch.equals("B4") ){
		//			
		//		}
		//		else{
		//			combtype = "WS";
		//			
		//		}
		return combtype;
	}

}
