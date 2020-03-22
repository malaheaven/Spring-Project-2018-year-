package com.itbank.neail.member;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MemberMapper implements RowMapper<MemberDTO> {

	@Override
	public MemberDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setId(rs.getString(1));
		dto.setPw(rs.getString(2));
		dto.setName(rs.getString(3));
		dto.setTel(rs.getString(4));
		dto.setAddress(rs.getString(5));
		dto.setEmail(rs.getString(6));
		dto.setGender(rs.getString(7));
		return dto;
	}

}
