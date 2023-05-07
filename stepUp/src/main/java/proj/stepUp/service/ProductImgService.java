package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.ProductImgVO;

public interface ProductImgService {
	public int insertProductImg(ProductImgVO vo);
	public List<ProductImgVO> selectByProductIndex(int prdIndex);
	public int updateSubImg(ProductImgVO vo);
}
