package coding.mentor.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import coding.mentor.db.util.DBUtil;
import coding.mentor.entity.Account;

public class AccountService {
	public Account getAccountByUsernameAndPassWord(String username, String password) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Account account = null;
		try {
			// make connection to my sql
			conn = DBUtil.makeConnection();

			ps = conn.prepareStatement("select * from `account` where `username` = ? AND `password` = ?");
			ps.setString(1, username);
			ps.setString(2, password);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS

			if (rs.next()) {
				account = new Account(username, password);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return account;
	}

	public Account checkAccountExist(String username) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Account account = null;
		try {
			// make connection to my sql
			conn = DBUtil.makeConnection();

			ps = conn.prepareStatement("select * from `account` where `username` = ?");
			ps.setString(1, username);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS

			if (rs.next()) {
				String password = rs.getString("password");
				account = new Account(username, password);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return account;
	}

	public void register(String username, String password, String email) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// make connection to my sql
			conn = DBUtil.makeConnection();

			ps = conn.prepareStatement("insert into `account` (`username`, `password`, `email`) VALUES (?, ?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
}
