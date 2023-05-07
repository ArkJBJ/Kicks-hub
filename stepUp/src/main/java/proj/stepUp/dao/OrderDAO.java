package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int selectOrderNum(String num) {//주문번호 중복 확인
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectOrderNum", num);
	}
	
	public int insertOrder(OrderVO vo) {//주문 생성
		return sqlSession.insert("proj.stepUp.mapper.orderMapper.insertOrder", vo);
	}
	
	public int selectByOrder(ReviewVO vo) {//해당 상품 주문 기록이 존재하는지 확인
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectByOrder", vo);
	}
	
	public List<OrderVO> selectManager(SearchVO vo) {
		return sqlSession.selectList("proj.stepUp.mapper.orderMapper.selectManager", vo);
	}
	
	public int selectManagerCount(SearchVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectManagerCount", vo);
	}
	
	public OrderVO selectByOrderIndex(int orderIndex) {//해당 상품 주문 기록이 존재하는지 확인
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectByOrderIndex", orderIndex);
	}
	
	public int updateOrderStatus(OrderVO vo) {
		return sqlSession.update("proj.stepUp.mapper.orderMapper.updateOrderStatus", vo);
	}
	
	public List<OrderVO> selectUser(SearchVO searchVO){
		return sqlSession.selectList("proj.stepUp.mapper.orderMapper.selectUser", searchVO);
	}
	
	public int selectUserCount(int userIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.orderMapper.selectUserCount", userIndex);
	}
	
}
