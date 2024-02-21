package com.voting.system.helper;

import java.util.List;
import java.util.stream.Collectors;

public class QueryHelper {

	public static String createQuery(List<String> inputList) {
		inputList = filterNulls(inputList);
		return inputList.stream().map(str -> str + "=?").collect(Collectors.joining(" and "));
	}

	static List<String> filterNulls(List<String> inputList) {
		return inputList.stream().filter(str -> str != null).toList();
	}
	
	
	
}
