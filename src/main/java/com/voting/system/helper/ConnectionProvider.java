package com.voting.system.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection con;

	public static Connection getConnection() {
		try {

			if (con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/voting_app?characterEncoding=utf8",
						"root", "root");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static boolean studentHasVoted(String studentId,String electionId) {
		String query = "select count(voter_id) as count from vote where voter_id=? and election_id=?";
		try {
			PreparedStatement statement = con.prepareStatement(query);
			statement.setString(1, studentId);
			statement.setString(2, electionId);

			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				int count = resultSet.getInt("count");
				if (count > 0) {
					return true;
				} else {
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;

	}
}
