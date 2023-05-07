package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.OrderItemVO;
import proj.stepUp.vo.SizeVO;

public interface SizeService {
	public int insertSize(SizeVO vo);
	public List<SizeVO> selectByPrdIndex(int prdIndex);
	public int updateSizeStock(SizeVO vo);
	public SizeVO selectSizeIndex(int sizeIndex);
	public int updateSubtract(OrderItemVO oiVO);
	public int selectStockCheck(OrderItemVO oiVO);
}
