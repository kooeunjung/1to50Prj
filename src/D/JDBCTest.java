package D;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import com.oneto.web.dao.MemberDAO;
import com.oneto.web.entity.Member;

public class JDBCTest {

	//MemberManager 클래스에서db 처리함!
	public static void main(String[] args) throws Exception {
		
		//객체생성
		MemberDAO mm = new MemberDAO();
		//"ckt"존재 검사
		if(mm.isExist("koo", "114"))
			System.out.println("있어요~~");
		
		//insert함수
		/*Member mem = new Member("lee2","lee2","이순신","거북선","쳐부수기");
		mm.insert(mem);
		 */		
		//select
		/*ArrayList<Member> list = mm.select();*/
		
		/*for(int i=0;i<list.size();i++){
			Member m = list.get(i);
		}
		mm.close();*/
		//insert2 비정상함수 
		//m.insert2("kooo", "kooo", "구은정", "women", "영화");
		
		//select함수
	}
	
	/*
	public static void main2(String[] args) throws Exception {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// class.forName("JDBCTest");
		// 리플랙션 개념
		
		
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "testdb", "testdb1234");

		System.out.println("커넥션 성공");

		Statement stmt = conn.createStatement();

		String sql = "select * from member";
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			System.out.println(rs.getString("mem_id") + " " + rs.getString("mem_name"));
		}
		rs.close();
		stmt.close();
		
		String mem_id = "koo";
		String mem_pwd= "koo";	
		String mem_name= "구은정";
		String gender = "women";
		String hobby = "영화,여행";
		
		sql = "INSERT INTO member VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql); //?물음표를 쓸려면 prepared 를 씀@
		
		pstmt.setString(1, mem_id);
		pstmt.setString(2, mem_pwd);
		pstmt.setString(3, mem_name);
		pstmt.setString(4, gender);
		pstmt.setString(5, hobby);
		
		int out = pstmt.executeUpdate(); //레코드를 하나 입력ㅎ -
		System.out.println("out=" + out);
		pstmt.close();
		conn.close();
	}*/
}
