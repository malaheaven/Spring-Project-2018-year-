package com.itbank.neail.mytrip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MytripDAO {//update는 안만들었음 업데이트형식 보단 그냥 삭제해버리는게 나을듯해서 

	@Autowired
	JdbcTemplate jdbc;
	
	public void insert(MytripDTO dto){
		String sql="insert into mytrip values (?,?,?,?,?,?,?,?,?)";
		jdbc.update(sql,dto.getTripid(),dto.getId(),dto.getDay1(),dto.getDay2(),dto.getDay3(),dto.getDay4(),
				dto.getDay5(),dto.getDay6(),dto.getDay7());
	}
	
	public void delete(String tripid){
		String sql="delete from mytrip where tripid=?"; 
		Object[] ob = {tripid};
		jdbc.update(sql,ob);
	}	

	public List<MytripDTO> select(String id){
	      String sql="select * from mytrip where id=?";
	      Object[] ob = {id};
	      return jdbc.query(sql,ob,new MytripMapper());
	      
	   }  
	public List<MytripDTO> selectAll(){
		String sql="select * from mytrip";
		return jdbc.query(sql, new MytripMapper());
		
	}
	 
		
}		










