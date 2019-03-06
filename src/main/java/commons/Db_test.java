package commons;

import java.util.ArrayList;
import java.util.HashMap;

public class Db_test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<HashMap<String, String>> rs=Db.selectListMap("SELECT * FROM spr_test ORDER BY S_NUM DESC");
		System.out.println(rs);
	}

}
