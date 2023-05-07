package proj.stepUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj.stepUp.dao.AdminDAO;
import proj.stepUp.vo.SlideVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public int slideinsert(SlideVO slvo) {
			
		
		return adminDAO.slideInsert(slvo);
	}

	@Override
	public List<SlideVO> slideSelect() {
		
		return adminDAO.slideSelect();
	}

}
