package proj.stepUp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRivew(ReviewVO vo) {//상품 리뷰 추가
		return sqlSession.insert("proj.stepUp.mapper.reviewMapper.insertRivew", vo);
	}
	
	public List<ReviewVO> selectReview(ReviewVO vo) {//상품 리뷰 추가
		return sqlSession.selectList("proj.stepUp.mapper.reviewMapper.selectReview", vo);
	}
	
	public int selectCount(int prdIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.reviewMapper.selectCount", prdIndex);
	}
	
	public int selectCheckReview(ReviewVO vo) {
		return sqlSession.selectOne("proj.stepUp.mapper.reviewMapper.selectCheckReview", vo);
	}
	
	public int deleteReview(ReviewVO vo) {
		return sqlSession.delete("proj.stepUp.mapper.reviewMapper.deleteReview", vo);
	}
	
	public ReviewVO selectReviewModify(int reviewIndex) {
		return sqlSession.selectOne("proj.stepUp.mapper.reviewMapper.selectReviewModify", reviewIndex);
	}
	
	public int updateReview(ReviewVO vo) {
		return sqlSession.update("proj.stepUp.mapper.reviewMapper.updateReview", vo);
	}
	
	public List<ReviewVO> selectMyReview(SearchVO searchVO) {
		return sqlSession.selectList("proj.stepUp.mapper.reviewMapper.selectMyReview", searchVO);
	}
	
	public int myReviewTotalCnt(SearchVO searchVO) {
		return sqlSession.selectOne("proj.stepUp.mapper.reviewMapper.myReviewTotalCnt", searchVO);
	}
}
