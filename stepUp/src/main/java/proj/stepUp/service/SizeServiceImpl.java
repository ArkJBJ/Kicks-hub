package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.SizeDAO;
import proj.stepUp.vo.OrderItemVO;
import proj.stepUp.vo.SizeVO;

@Service
public class SizeServiceImpl implements SizeService{
	
	@Autowired
	private SizeDAO sizeDAO;
	
	@Override
	public int insertSize(SizeVO vo) {
		return sizeDAO.insertSize(vo);
	}

	@Override
	public List<SizeVO> selectByPrdIndex(int prdIndex) {
		return sizeDAO.selectByPrdIndex(prdIndex);
	}

	@Override
	public int updateSizeStock(SizeVO vo) {
		return sizeDAO.updateSizeStock(vo);
	}

	@Override
	public SizeVO selectSizeIndex(int sizeIndex) {
		return sizeDAO.selectSizeIndex(sizeIndex);
	}

	@Override
	public int updateSubtract(OrderItemVO oiVO) {
		return sizeDAO.updateSubtract(oiVO);
	}

	@Override
	public int selectStockCheck(OrderItemVO oiVO) {
		return sizeDAO.selectStockCheck(oiVO);
	}

}
