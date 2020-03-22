package com.itbank.neail.member;

import java.sql.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	JdbcTemplate jdbc;

	public void insert(MemberDTO dto) {
		String sql = "insert into member values(?,?,?,?,?,?,?)";
		jdbc.update(sql, dto.getId(), dto.getPw(), dto.getName(), dto.getTel(), dto.getAddress(), dto.getEmail(),
				dto.getGender());
	}

	public void delete(String id) {
		String sql = "delete from member where id=?";
		jdbc.update(sql, id);
	}

	public void update(MemberDTO dto) {
		String sql = "update member set pw=?,name=?,tel=?,address=?,email=? where id=?";
		jdbc.update(sql,dto.getPw(),dto.getName(),dto.getTel(),dto.getAddress(),dto.getEmail(), dto.getId());
	}
	//회원 정보 페이지
	public MemberDTO select(String id) {
		String sql = "select * from member where id=?";
		Object[] ob = {id};
		return jdbc.queryForObject(sql, ob, new MemberMapper());

	}

	public List<MemberDTO> selectAll() {
		String sql = "select * from member";
		return jdbc.query(sql, new MemberMapper());
	}

	public MemberDTO login(String id, String pw) {
		String sql = "select * from member where id = ? and pw = ?";
		Object[] ob = { id, pw };
		return jdbc.queryForObject(sql, ob, new MemberMapper());
	}

	public boolean idcheck(String id) {
		boolean check = false;
		String sql = "select * from member where id = ?";
		try {
			Object[] ob = { id };
			jdbc.queryForObject(sql, ob, new MemberMapper());
			return check = true;
		} catch (Exception e) {
			return check;
		}

	}
	public boolean checkpw(String id,String pw) {
		boolean check = false;
		String sql = "select * from member where id=? and pw = ?";
		try {
			Object[] ob = { id, pw };
			jdbc.queryForObject(sql, ob, new MemberMapper());
			return check = true;
		} catch (Exception e) {
			return check;
		}
		
	}
}