package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.CartDAO;
import proj.stepUp.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public int insertCart(CartVO vo) {
		return cartDAO.insertCart(vo);
	}
	
	@Override
	public List<CartVO> list(int userIndex){
		return cartDAO.list(userIndex);
	}

	@Override
	public int deleteCart(CartVO vo) {
		return cartDAO.deleteCart(vo);
	}

	@Override
	public int selectCheck(CartVO vo) {
		return cartDAO.selectCheck(vo);
	}


}
