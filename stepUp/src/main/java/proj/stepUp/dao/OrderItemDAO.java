package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.OrderItemVO;

@Repository
public class OrderItemDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertOrderItem(OrderItemVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.orderItemMapper.insertOrderItem", vo);
	}
	
	public List<OrderItemVO> selectOrderInfo(int orderIndex) {
		return sqlSession.selectList("proj.stepUp.mapper.orderItemMapper.selectOrderInfo", orderIndex);
	}
}
