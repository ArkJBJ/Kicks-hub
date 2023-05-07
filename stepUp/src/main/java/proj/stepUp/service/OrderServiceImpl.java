package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.OrderDAO;
import proj.stepUp.vo.OrderVO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int selectOrderNum(String num) {
		return orderDAO.selectOrderNum(num);
	}

	@Override
	public int insertOrder(OrderVO vo) {
		return orderDAO.insertOrder(vo);
	}

	@Override
	public int selectByOrder(ReviewVO vo) {
		return orderDAO.selectByOrder(vo);
	}

	@Override
	public List<OrderVO> selectManager(SearchVO vo) {
		return orderDAO.selectManager(vo);
	}

	@Override
	public int selectManagerCount(SearchVO vo) {
		return orderDAO.selectManagerCount(vo);
	}

	@Override
	public OrderVO selectByOrderIndex(int orderIndex) {
		return orderDAO.selectByOrderIndex(orderIndex);
	}

	@Override
	public int updateOrderStatus(OrderVO vo) {
		return orderDAO.updateOrderStatus(vo);
	}

	@Override
	public List<OrderVO> selectUser(SearchVO searchVO) {
		return orderDAO.selectUser(searchVO);
	}

	@Override
	public int selectUserCount(int userIndex) {
		return orderDAO.selectUserCount(userIndex);
	}

}
