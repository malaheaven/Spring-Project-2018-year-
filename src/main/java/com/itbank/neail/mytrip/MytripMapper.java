package com.itbank.neail.mytrip;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MytripMapper implements RowMapper<MytripDTO> {

	@Override
	public MytripDTO mapRow(ResultSet rs, int arg1) throws SQLException {
		MytripDTO dto=new MytripDTO();
		dto.setTripid(rs.getInt(1));
		dto.setId(rs.getString(2));
		dto.setDay1(rs.getString(3));
		dto.setDay2(rs.getString(4));
		dto.setDay3(rs.getString(5));
		dto.setDay4(rs.getString(6));
		dto.setDay5(rs.getString(7));
		dto.setDay6(rs.getString(8));
		dto.setDay7(rs.getString(9));
		return dto;
	}

}
