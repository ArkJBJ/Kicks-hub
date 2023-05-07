package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.ReviewDAO;
import proj.stepUp.vo.ReviewVO;
import proj.stepUp.vo.SearchVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public int insertRivew(ReviewVO vo) {//서비스 : 상품리뷰 추가
		return reviewDAO.insertRivew(vo);
	}

	@Override
	public List<ReviewVO> selectReview(ReviewVO vo) {//상품 리뷰 검색(제품인덱스 기준)
		return reviewDAO.selectReview(vo);
	}

	@Override
	public int selectCount(int prdIndex) {
		return reviewDAO.selectCount(prdIndex);
	}

	@Override
	public int selectCheckReview(ReviewVO vo) {
		return reviewDAO.selectCheckReview(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		return reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO selectReviewModify(int reviewIndex) {
		return reviewDAO.selectReviewModify(reviewIndex);
	}

	@Override
	public int updateReview(ReviewVO vo) {
		return reviewDAO.updateReview(vo);
	}

	@Override
	public List<ReviewVO> selectMyReview(SearchVO searchVO) {
		return reviewDAO.selectMyReview(searchVO);
	}

	@Override
	public int myReviewTotalCnt(SearchVO searchVO) {
		return reviewDAO.myReviewTotalCnt(searchVO);
	}

}
