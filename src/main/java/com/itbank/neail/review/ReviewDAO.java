package com.itbank.neail.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.neail.location.LocationDTO;
import com.itbank.neail.location.LocationMapper;

@Repository
public class ReviewDAO {
	@Autowired
	JdbcTemplate jdbc;

	public void insert(ReviewDTO dto) {
		String sql = "insert into review(userid, content, img1, img2, name) values(?,?,?,?,?)";
		jdbc.update(sql, dto.getUserid(), dto.getContent(), dto.getImg1(), dto.getImg2(), dto.getName());

	}

	public List<ReviewDTO> selectAll() {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select * from review";
		return jdbc.query(sql, new ReviewMapper());
	}

	public ReviewDTO selectByReviewid(int id) {
		String sql = "select * from review where reviewid = ?";
		Object[] ob = { id };
		return jdbc.queryForObject(sql, ob, new ReviewMapper());
	}

	public void updateLike(int id) {
		ReviewDTO dto = selectByReviewid(id);
		int count = dto.getLikecount();
		count++;
		String sql = "update review set likecount=? where reviewid=?";
		jdbc.update(sql, count, dto.getReviewid());
	}

	public void deleteReview(String id) {
		String sql = "delete from review where reviewid = ?";
		jdbc.update(sql, id);
	}

	public void updateReview(ReviewDTO dto) {
		String sql = "update review set content=?,name=?,img1=?,img2=? where reviewid=?";
		jdbc.update(sql, dto.getContent(), dto.getName(), dto.getImg1(), dto.getImg2(), dto.getReviewid());
	}

	public List<ReviewDTO> selectAllByKeyWord(String keyword) {
		String key = "%" + keyword + "%";
		System.out.println(key);
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select * from review where name like ?";
		Object[] ob = { key };
		return jdbc.query(sql, ob, new ReviewMapper());
	}

	public List<ReviewDTO> selectAllByuserid(String id) {

		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		String sql = "select * from review where userid = ?";
		Object[] ob = { id };
		return jdbc.query(sql, ob, new ReviewMapper());
	}
}
