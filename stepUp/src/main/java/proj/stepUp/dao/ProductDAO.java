package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ProductVO;
import proj.stepUp.vo.SearchVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProduct(ProductVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.productMapper.insertProduct", vo);
	}
	
	public ProductVO selectProductIndex(int prdIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.productMapper.selectProductIndex", prdIndex);
	}
	
	public List<ProductVO> selectProductByDate(int maxPrd) {
		return sqlSession.selectList("proj.stepUp.mapper.productMapper.selectProductByDate", maxPrd);
	}
	
	public List<ProductVO> selectProductSales(int maxPrd){
		return sqlSession.selectList("proj.stepUp.mapper.productMapper.selectProductSales", maxPrd);
	}
	
	public List<ProductVO> selectBrandPage(SearchVO searchVO){
		return sqlSession.selectList("proj.stepUp.mapper.productMapper.selectBrandPage",searchVO);
	}
	
	public int selectBrandToal(SearchVO searchVO){
		return sqlSession.selectOne("proj.stepUp.mapper.productMapper.selectBrandToal",searchVO);
	}
	
	public int selectByPrdCode(String prdCode) {
		return sqlSession.selectOne("proj.stepUp.mapper.productMapper.selectByPrdCode", prdCode);
	}
	
	public int selectManageCount(SearchVO searchVO){
		return sqlSession.selectOne("proj.stepUp.mapper.productMapper.selectManageCount",searchVO);
	}
	
	public List<ProductVO> selectManageList(SearchVO searchVO){
		return sqlSession.selectList("proj.stepUp.mapper.productMapper.selectManageList",searchVO);
	}
	
	public int updatePrdDel(int prdIndex){
		return sqlSession.update("proj.stepUp.mapper.productMapper.updatePrdDel", prdIndex);
	}
	
	public int updateProduct(ProductVO vo){
		return sqlSession.update("proj.stepUp.mapper.productMapper.updateProduct", vo);
	}
}
