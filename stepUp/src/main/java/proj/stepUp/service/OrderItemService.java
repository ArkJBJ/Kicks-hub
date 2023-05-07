package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.OrderItemVO;

public interface OrderItemService {
	public int insertOrderItem(OrderItemVO vo);
	public List<OrderItemVO> selectOrderInfo(int orderIndex);
}
