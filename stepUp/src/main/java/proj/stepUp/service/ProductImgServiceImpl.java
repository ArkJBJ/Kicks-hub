package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ProductImgDAO;
import proj.stepUp.vo.ProductImgVO;

@Service
public class ProductImgServiceImpl implements ProductImgService{
	
	@Autowired
	private ProductImgDAO productImgDAO;
	
	@Override
	public int insertProductImg(ProductImgVO vo) {//이미지 insert
		return productImgDAO.insertProductImg(vo);
	}

	@Override
	public List<ProductImgVO> selectByProductIndex(int prdIndex) {//상품 인덱스로 검색
		return productImgDAO.selectByProductIndex(prdIndex);
	}

	@Override
	public int updateSubImg(ProductImgVO vo) {
		return productImgDAO.updateSubImg(vo);
	}

}
