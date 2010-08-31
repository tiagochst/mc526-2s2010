package mc536.mysql.first;
			
import mc536.mysql.first.MySQLAccess;

public class Main {
	public static void main(String[] args) throws Exception {
		MySQLAccess dao = new MySQLAccess();
		dao.readDataBase();
	}


}

