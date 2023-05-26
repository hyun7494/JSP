package kr.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory1.beans.TermsBean;
import kr.co.farmstory1.beans.UserBean;
import kr.co.farmstory1.db.DBCP;
import kr.co.farmstory1.db.SQL;

public class UserDAO {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private UserDAO() {}
	
	public void insertUser(UserBean user) {
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, user.getUid() );
			psmt.setString(2, user.getPass() );
			psmt.setString(3, user.getName() );
			psmt.setString(4, user.getNick() );
			psmt.setString(5, user.getEmail() );
			psmt.setString(6, user.getHp() );
			psmt.setString(7, user.getZip() );
			psmt.setString(8, user.getAddr1() );
			psmt.setString(9, user.getAddr2() );
			psmt.setString(10, user.getRegip() );
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public TermsBean selectTerms() {
		TermsBean tb = null;
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()) {
				tb = new TermsBean();
				tb.setTerms(rs.getString(1));
				tb.setPrivacy(rs.getString(2));
			}
			
			rs.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return tb;
	}
	public UserBean selectUser(String uid, String pass) {
		
		UserBean ub = null;
		try {
			logger.debug("selectUser start");
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				ub = new UserBean();
				ub.setUid(rs.getString(1));
				ub.setPass(rs.getString(2));
				ub.setName(rs.getString(3));
				ub.setNick(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setHp(rs.getString(6));
				ub.setGrade(rs.getInt(7));
				ub.setZip(rs.getString(8));
				ub.setAddr1(rs.getString(9));
				ub.setAddr2(rs.getString(10));
				ub.setRegip(rs.getString(11));
				ub.setRdate(rs.getString(12));
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.info("ub" + ub);
		return ub;
	}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
	
	public int selectCountUid(String uid) {
		int result =0;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	public int selectCountNick(String nick) {
		int result =0;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
}
