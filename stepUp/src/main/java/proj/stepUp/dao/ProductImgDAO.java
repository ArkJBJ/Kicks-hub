package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ProductImgVO;

@Repository
public class ProductImgDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertProductImg(ProductImgVO vo) {
		return sqlSession.insert("proj.stepUp.mapper.productImgMapper.insertProductImg", vo);
	}
	
	public List<ProductImgVO> selectByProductIndex(int prdIndex){//상품 인덱스를 이용하여 제품 서브이미지 검색
		return sqlSession.selectList("proj.stepUp.mapper.productImgMapper.selectByProductIndex", prdIndex);
	}
	
	public int updateSubImg(ProductImgVO vo) {
		return sqlSession.update("proj.stepUp.mapper.productImgMapper.updateSubImg", vo);
	}
}
