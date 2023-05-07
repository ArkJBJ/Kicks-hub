package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ProductDAO;
import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SearchVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int insertProduct(ProductVO vo) {
		return productDAO.insertProduct(vo);
	}

	@Override
	public ProductVO selectProductIndex(int prdIndex) {
		return productDAO.selectProductIndex(prdIndex);
	}

	@Override
	public List<ProductVO> selectProductByDate(int maxPrd) {
		return productDAO.selectProductByDate(maxPrd);
	}

	@Override
	public List<ProductVO> selectProductSales(int maxPrd) {
		return productDAO.selectProductSales(maxPrd);
	}

	@Override
	public List<ProductVO> selectBrandPage(SearchVO searchVO) {
		return productDAO.selectBrandPage(searchVO);
	}

	@Override
	public int selectBrandToal(SearchVO searchVO) {
		return productDAO.selectBrandToal(searchVO);
	}

	@Override
	public int selectByPrdCode(String prdCode) {
		return productDAO.selectByPrdCode(prdCode);
	}

	@Override
	public int selectManageCount(SearchVO searchVO) {
		return productDAO.selectManageCount(searchVO);
	}

	@Override
	public List<ProductVO> selectManageList(SearchVO searchVO) {
		return productDAO.selectManageList(searchVO);
	}

	@Override
	public int updatePrdDel(int prdIndex) {
		return productDAO.updatePrdDel(prdIndex);
	}

	@Override
	public int updateProduct(ProductVO vo) {
		return productDAO.updateProduct(vo);
	}
	
}
