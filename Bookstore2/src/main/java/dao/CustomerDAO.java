package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.CustomerVO;

public class CustomerDAO extends DBHelper{
	
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	
	
	public void insertCustomer(CustomerVO vo) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("insert into `customer` set `name`=?, `address`=?, `phone`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getAddress());
			psmt.setString(3, vo.getPhone());
			
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVO selectCustomer(int custID) {
		CustomerVO vo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `customer` where `custID`=?");
			psmt.setInt(1, custID);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new CustomerVO();
				vo.setCustID(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddress(rs.getString(3));
				vo.setPhone(rs.getString(4));
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<CustomerVO> selectCustomers() {
		
		List<CustomerVO> custs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `customer`");
			custs = new ArrayList<>();
			
			while(rs.next()) {
				CustomerVO vo = new CustomerVO();
				vo.setCustID(rs.getInt(1));
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
	
	public void updateCustomer(CustomerVO vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `customer` SET `name`=?, `address`=?, `phone`=? WHERE `custID`=?");
			psmt.setString(1,vo.getName());
			psmt.setString(2,vo.getAddress());
			psmt.setString(3,vo.getPhone());
			psmt.setInt(4,vo.getCustID());
			
			psmt.executeUpdate();
			
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void deleteCustomer(int custID) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `customer` where `custID`=?");
			psmt.setInt(1, custID);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
