package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.SlideVO;

@Repository

public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int slideInsert(SlideVO slvo) {
		
		return sqlSession.insert("proj.stepUp.mapper.adminMapper.slideInsert", slvo);
	}
	
	public List<SlideVO>slideSelect() {
		
		return sqlSession.selectList("proj.stepUp.mapper.adminMapper.selectSlide");
	}
}
