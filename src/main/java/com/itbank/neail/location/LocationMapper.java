package com.itbank.neail.location;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class LocationMapper implements RowMapper<LocationDTO> {

	@Override
	public LocationDTO mapRow(ResultSet rs, int arg1) throws SQLException {
		LocationDTO dto=new LocationDTO();
		dto.setLocation(rs.getString(1));
		dto.setLocationaddress(rs.getString(2));
		dto.setSights(rs.getString(3));
		dto.setImagename1(rs.getString(4));
		dto.setImagename2(rs.getString(5));
		dto.setImagename3(rs.getString(6));
		return dto;
	}

}
