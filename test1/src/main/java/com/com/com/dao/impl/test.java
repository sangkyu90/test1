package com.com.com.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class test {

	public static void main(String[] args) {
		String[] b = {"NEW YORK","DALLAS","CHICAGO","sss"};
		
		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("a", "1");
//		map.put("a1", "2");
//		map.put("a2", "3");
//		map.put("a3", "4");
//		map.put("a", "5");
		
//		Iterator<String> keys = map.keySet().iterator();
//		while (keys.hasNext() ) {
//			String key = keys.next();
//			System.out.println("key=["+key+"]\nval=["+map.get(key)+"]");
//			
//		}
		
//		System.out.println(map);
		
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		String[] a = {"ACCOUNTING","RESEARCH","SALES","OPERATIONS"};	  
		

		
		for(int i=1; i< 5; i++) {
			Map<String,Object> tmpMap = new HashMap<String, Object>();
			tmpMap.put("DEPTNO", i+"0");
			tmpMap.put("DNAME", a[i-1]);
			tmpMap.put("LOC", b[i-1]);
			listMap.add(tmpMap);
		}
		
		System.out.println("1");
		for(Map<String,Object> map :listMap) {
			System.out.println(map.get("DEPTNO"));
			System.out.println(map.get("DNAME") );
			System.out.println(map.get("LOC")   );
		}
		
		System.out.println("2");
	}

}
