package com.itbank.neail.review;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ReviewMapper implements RowMapper<ReviewDTO> {

	@Override
	public ReviewDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewDTO dto=new ReviewDTO();
		dto.setReviewid(rs.getInt(1));
		dto.setUserid(rs.getString(2));
		dto.setDate(rs.getDate(3));
		dto.setContent(rs.getString(4));
		dto.setImg1(rs.getString(5));
		dto.setImg2(rs.getString(6));
		dto.setName(rs.getString(7));
		dto.setLikecount(rs.getInt(8));
		return dto;
	}

}
