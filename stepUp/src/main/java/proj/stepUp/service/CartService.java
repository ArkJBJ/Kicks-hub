package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.CartVO;

public interface CartService {
	public int insertCart(CartVO vo);
	public List<CartVO> list(int userIndex);
	public int deleteCart(CartVO vo);
	public int selectCheck(CartVO vo);

}
