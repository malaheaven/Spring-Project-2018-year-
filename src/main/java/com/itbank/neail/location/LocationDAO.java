package com.itbank.neail.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itbank.neail.member.MemberMapper;

@Repository
public class LocationDAO {

	@Autowired
	JdbcTemplate jdbc;

	public void insert(LocationDTO dto) {
		String sql = "insert into location values(?,?,?,?,?,?)";
		jdbc.update(sql, dto.getLocation(), dto.getLocationaddress(), dto.getSights(), dto.getImagename1(),
				dto.getImagename2(), dto.getImagename3());
	}

	public void delete(String sights) {
		String sql = "delete from location where sights = ?";
		jdbc.update(sql, sights);
	}

	public void update(LocationDTO dto) {
		String sql = "update location set locationaddress = ?, imagename1=?,imagename2=?,imagename3=? where sights=?";
		jdbc.update(sql, dto.getLocationaddress(), dto.getImagename1(), dto.getImagename2(), dto.getImagename3(), dto.getSights());
	}

	public LocationDTO select(LocationDTO dto) {
		String sql = "select * from location where sights = ?";
		Object[] ob = { dto.getSights() };
		return jdbc.queryForObject(sql, ob, new LocationMapper());
	}

	public List<LocationDTO> selectAll() {
		String sql = "select * from location";
		return jdbc.query(sql, new LocationMapper());

	}

	public List<LocationDTO> selectlocation(String location) {
		String sql = "select * from location where location =?";
		Object[] ob = { location };
		return jdbc.query(sql, ob, new LocationMapper());
	}
	//sights 중복검사
	public boolean sightscheck(String sights) {
		boolean check = false;
		String sql = "select * from location where sights = ?";
		try {
			Object[] ob = { sights };
			jdbc.queryForObject(sql, ob, new LocationMapper());
			return check = true;
		} catch (Exception e) {
			return check;
		}

	}

}
