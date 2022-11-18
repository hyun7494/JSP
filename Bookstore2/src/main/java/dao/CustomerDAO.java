package dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.BookVO;
import vo.CustomerVO;

public class CustomerDAO extends DBHelper{
	
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	
	public void insertCustomer(CustomerVO vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `customer` values (?, ?, ?, ?)");
			psmt.setInt(1, vo.getCustId());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddress());
			psmt.setString(4, vo.getPhone());
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVO selectCustomer(int custId) {
		
		CustomerVO vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `customer` where `custId`=?");
			psmt.setInt(1, custId);
			psmt.executeQuery();
			
		while(rs.next()) {
			vo = new CustomerVO();
			vo.setCustId(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setAddress(rs.getString(3));
			vo.setPhone(rs.getString(4));
			
		}
		
		close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<CustomerVO> selectCustomers() {
		
		List<CustomerVO> custs = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `customer`");
			
			while(rs.next()) {
				CustomerVO vo = new CustomerVO();
				vo.setCustId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
				custs.add(vo);
			}
			
			close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return custs;
	}
	
	public void updateCustomer() {}


}
